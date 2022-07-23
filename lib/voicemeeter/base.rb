require "observer"

require "voicemeeter/runvm"
require "voicemeeter/configs"
require "voicemeeter/errors"

module Voicemeeter
  class Base
    "
    Base class responsible for wrapping the C Remote API

    Mixin required modules
    "
    include Observable
    include Configs
    include RunVM

    attr_accessor :strip, :bus, :button, :vban, :command, :recorder, :device
    attr_accessor :strip_mode

    attr_reader :kind, :p_in, :v_in, :p_out, :v_out, :retval, :cache
    attr_reader :running, :_strip_comp, :_bus_comp, :delay

    DELAY = 0.001
    SYNC = false
    RATELIMIT = 0.033
    SIZE = 1

    def initialize(kind, **kwargs)
      @kind = kind
      @p_in, @v_in = kind.layout[:strip].values
      @p_out, @v_out = kind.layout[:bus].values
      @cache = Hash.new
      @sync = kwargs[:sync] || SYNC
      @ratelimit = kwargs[:ratelimit] || RATELIMIT
      @running = false
      @strip_mode = 0
      @delay = DELAY
    end

    def init_thread
      @running = true
      @cache["strip_level"], @cache["bus_level"] = _get_levels
      Thread.new do
        loop do
          Thread.stop if !@running
          if pdirty?
            changed
            notify_observers("pdirty")
          end
          if mdirty?
            changed
            notify_observers("mdirty")
          end
          if ldirty?
            changed
            @_strip_comp =
              @cache["strip_level"].map.with_index do |x, i|
                !(x == @strip_buf[i])
              end
            @_bus_comp =
              @cache["bus_level"].map.with_index { |x, i| !(x == @bus_buf[i]) }
            @cache["strip_level"] = @strip_buf
            @cache["bus_level"] = @bus_buf
            notify_observers("ldirty")
          end
          sleep(@ratelimit)
        end
      end
    end

    def end_thread
      @running = false
    end

    def login
      @@cdll.call(:login)
      clear_polling
    rescue CAPIErrors => error
      case
      when error.value == 1
        self.start(@kind.name)
        clear_polling
      when error.value < 0
        raise
      end
    end

    def logout
      clear_polling
      sleep(0.1)
      @@cdll.call(:logout)
    end

    def type
      c_type = FFI::MemoryPointer.new(:long, SIZE)
      @@cdll.call(:vmtype, c_type)
      types = { 1 => "basic", 2 => "banana", 3 => "potato" }
      types[c_type.read_long]
    end

    def version
      c_ver = FFI::MemoryPointer.new(:long, SIZE)
      @@cdll.call(:vmversion, c_ver)
      v1 = (c_ver.read_long & 0xFF000000) >> 24
      v2 = (c_ver.read_long & 0x00FF0000) >> 16
      v3 = (c_ver.read_long & 0x0000FF00) >> 8
      v4 = c_ver.read_long & 0x000000FF
      "#{v1}.#{v2}.#{v3}.#{v4}"
    end

    def get_parameter(name, is_string = false)
      self.polling("get_parameter", name: name) do
        if is_string
          c_get = FFI::MemoryPointer.new(:string, 512, true)
          @@cdll.call(:get_parameter_string, name, c_get)
          c_get.read_string
        else
          c_get = FFI::MemoryPointer.new(:float, SIZE)
          @@cdll.call(:get_parameter_float, name, c_get)
          c_get.read_float.round(1)
        end
      end
    end

    def set_parameter(name, value)
      if value.is_a? String
        @@cdll.call(:set_parameter_string, name, value)
      else
        @@cdll.call(:set_parameter_float, name, value.to_f)
      end
      @cache.store(name, value)
    end

    def get_buttonstatus(id, mode)
      self.polling("get_buttonstatus", id: id, mode: mode) do
        c_get = FFI::MemoryPointer.new(:float, SIZE)
        @@cdll.call(:get_buttonstatus, id, c_get, mode)
        c_get.read_float.to_i
      end
    end

    def set_buttonstatus(id, state, mode)
      @@cdll.call(:set_buttonstatus, id, state, mode)
      @cache.store("mb_#{id}_#{mode}", state)
    end

    def set_parameter_multi(param_hash)
      param_hash.each do |(key, val)|
        prop, m2, m3, *rem = key.to_s.split("_")
        if m2.to_i.to_s == m2
          m2 = m2.to_i
        elsif m3.to_i.to_s == m3
          m3 = m3.to_i
        end

        case prop
        when "strip"
          self.strip[m2].set_multi(val)
        when "bus"
          self.bus[m2].set_multi(val)
        when "button", "mb"
          self.button[m2].set_multi(val)
        when "vban"
          if %w[instream in].include? m2
            self.vban.instream[m3].set_multi(val)
          elsif %w[outstream out].include? m2
            self.vban.outstream[m3].set_multi(val)
          end
        end
        sleep(DELAY)
      end
    end

    def get_level(type, index)
      c_get = FFI::MemoryPointer.new(:float, SIZE)
      @@cdll.call(:get_level, type, index, c_get)
      c_get.read_float
    end

    def _get_levels
      [
        (0...(2 * @p_in + 8 * @v_in)).map { |i| get_level(@strip_mode, i) },
        (0...(8 * (@p_out + @v_out))).map { |i| get_level(3, i) }
      ]
    end

    def get_num_devices(direction)
      unless %w[in out].include? direction
        raise VMRemoteErrors.new("expected in or out")
      end
      if direction == "in"
        val = @@cdll.call(:get_num_indevices)
      else
        val = @@cdll.call(:get_num_outdevices)
      end
      val[0]
    end

    def get_device_description(index, direction)
      unless %w[in out].include? direction
        raise VMRemoteErrors.new("expected in or out")
      end
      c_type = FFI::MemoryPointer.new(:long, SIZE)
      c_name = FFI::MemoryPointer.new(:string, 256, true)
      c_hwid = FFI::MemoryPointer.new(:string, 256, true)
      if direction == "in"
        @@cdll.call(:get_desc_indevices, index, c_type, c_name, c_hwid)
      else
        @@cdll.call(:get_desc_outdevices, index, c_type, c_name, c_hwid)
      end
      [c_name.read_string, c_type.read_long, c_hwid.read_string]
    end

    alias_method "set_multi", :set_parameter_multi
    alias_method "apply", :set_parameter_multi
    alias_method "get", :get_parameter
    alias_method "set", :set_parameter
    alias_method "pdirty", :pdirty?
    alias_method "mdirty", :mdirty?
    alias_method "ldirty", :ldirty?
  end
end
