require_relative "errors"

module Conversions
  module_function

  def Boolean(value)
    case value
    when true, 1
      true
    when false, nil, 0
      false
    else
      raise ArgumentError, "invalid value for Boolean(): \"#{value.inspect}\""
    end
  end
end

module Meta_Functions
  private

  include Conversions

  def make_accessor_bool(*params)
    params.each do |param|
      define_singleton_method("#{param}") do
        return !(self.getter("#{param}")).zero?
      end

      define_singleton_method("#{param}=") do |value|
        self.setter("#{param}", Boolean(value) ? 1 : 0)
      end
    end
  end

  def make_accessor_int(*params)
    params.each do |param|
      define_singleton_method("#{param}") do
        return self.getter("#{param}").to_i
      end
      define_singleton_method("#{param}=") do |value|
        self.setter("#{param}", value)
      end
    end
  end

  def make_accessor_float(*params)
    params.each do |param|
      define_singleton_method("#{param}") { return self.getter("#{param}") }
      define_singleton_method("#{param}=") do |value|
        self.setter("#{param}", value)
      end
    end
  end

  def make_accessor_string(*params)
    params.each do |param|
      define_singleton_method("#{param}") do
        return self.getter("#{param}", true)
      end
      define_singleton_method("#{param}=") do |value|
        self.setter("#{param}", value)
      end
    end
  end

  def make_reader_only(*params)
    params.each do |param|
      define_singleton_method("#{param}") { return self.getter("#{param}") }
    end
  end

  def make_writer_only(*params)
    params.each do |param|
      define_singleton_method("#{param}=") do |value = 1|
        self.setter("#{param}", value)
      end
    end
  end

  def make_channel_props(num_A, num_B)
    (1..(num_A + num_B)).map { |i| i <= num_A ? "A#{i}" : "B#{i - num_A}" }
  end

  def make_action_prop(*params)
    params.each do |param|
      define_singleton_method("#{param}") { self.setter("#{param}", 1) }
    end
  end
end

module Channel_Meta_Functions
  private

  include Conversions
  include Meta_Functions

  def make_accessor_bool(*params)
    params.each do |param|
      cmds = { eq: "EQ.on" }
      if cmds.key? param
        cmd = cmds[param]
      else
        cmd = param
      end

      define_singleton_method("#{param}") do
        return !(self.getter("#{cmd}")).zero?
      end

      define_singleton_method("#{param}=") do |value|
        self.setter("#{cmd}", Boolean(value) ? 1 : 0)
      end
    end
  end

  def make_accessor_float(*params)
    params.each do |param|
      define_singleton_method("#{param}") { return self.getter("#{param}") }

      define_singleton_method("#{param}=") do |value|
        self.setter("#{param}", value)
      end
    end
  end

  def make_accessor_int(*params)
    params.each do |param|
      define_singleton_method("#{param}") do
        return self.getter("#{param}").to_i
      end

      define_singleton_method("#{param}=") do |value|
        self.setter("#{param}", value)
      end
    end
  end

  def make_reader_only(*params)
    params.each do |param|
      cmds = { device: "device.name", sr: "device.sr" }
      if cmds.key? param
        cmd = cmds[param]
      else
        cmd = param
      end

      define_singleton_method("#{param}") do
        case param
        when :device
          return self.getter("#{cmd}", true)
        when :sr
          return self.getter("#{cmd}").to_i
        end
      end
    end
  end

  def make_bus_modes(*params)
    params.each do |param|
      define_singleton_method("#{param}") do
        @remote.clear_polling
        return !(self.getter("#{param}")).zero?
      end

      define_singleton_method("#{param}=") do |value|
        self.setter("#{param}", Boolean(value) ? 1 : 0)
      end
    end
  end
end

module Vban_Meta_Functions
  private

  include Conversions
  include Meta_Functions

  def make_reader_int(*params)
    params.each do |param|
      define_singleton_method("#{param}") do
        case param
        when :bit
          return self.getter("#{param}").to_i == 1 ? 16 : 24
        else
          return self.getter("#{param}").to_i
        end
      end
    end
  end

  def make_accessor_int(*params)
    params.each do |param|
      define_singleton_method("#{param}") do
        case param
        when :bit
          return self.getter("#{param}").to_i == 1 ? 16 : 24
        else
          return self.getter("#{param}").to_i
        end
      end

      opts = {
        sr: [
          11_025,
          16_000,
          22_050,
          24_000,
          32_000,
          44_100,
          48_000,
          64_000,
          88_200,
          96_000
        ],
        channel: (1..8),
        bit: [16, 24],
        quality: (0..4),
        route: (0..8)
      }

      define_singleton_method("#{param}=") do |value|
        unless opts[param].member? value
          raise OutOfBoundsErrors.new(opts[param])
        end
        case param
        when :bit
          self.setter("#{param}", value == 16 ? 1 : 2)
        else
          self.setter("#{param}", value)
        end
      end
    end
  end
end

module MacroButton_Meta_Functions
  private

  include Conversions

  def make_accessor_macrobutton(*params)
    params.each do |param|
      mode = { state: 1, stateonly: 2, trigger: 3 }

      define_singleton_method("#{param}") do
        return !(self.getter(mode[param])).zero?
      end

      define_singleton_method("#{param}=") do |value|
        self.setter(Boolean(value) ? 1 : 0, mode[param])
      end
    end
  end
end

module Commands_Meta_Functions
  private

  include Conversions
  include Meta_Functions
  def make_writer_bool(*params)
    params.each do |param|
      cmds = { showvbanchat: "DialogShow.VBANCHAT" }
      if cmds.key? param
        cmd = cmds[param]
      else
        cmd = param
      end

      define_singleton_method("#{param}=") do |value|
        self.setter("#{cmd}", Boolean(value) ? 1 : 0)
      end
    end
  end
end
