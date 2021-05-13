module Alias
    attr_reader :recorder, :button, :vban, :vban_in, :vban_out, :command

    def recorder=(value)
        @recorder = value
    end

    def command=(value)
        @command = value
    end

    def button=(value)
        @button = value
    end

    def vban=(value)
        if [false,true].include? value
            value = bool_to_float(value)
        end
        set_parameter("vban.Enable", value)
    end

    def vban(value)
        self.vban = value
    end

    def vban_in=(value)
        @vban_in = value
    end

    def vban_out=(value)
        @vban_out = value
    end

    def set_multi(value)
        set_parameter_multi(value)
    end

    def alias_factory
        self.recorder = Recorder.new(self)
        self.command = Command.new(self)

        self.button = []
        (1..70).each_with_index do |num, index|
            num = index if @base_0
            @button[num] = Macrobutton.new(self, index)
        end

        self.vban_in = []
        (1..@layout[:in_vban]).each_with_index do |num, index|
            num = index if @base_0
            @vban_in[num] = Vban.new(self, index, "in")
        end
        self.vban_out = []
        (1..@layout[:out_vban]).each_with_index do |num, index|
            num = index if @base_0
            @vban_out[num] = Vban.new(self, index, "out")
        end
    end

    class Alias
        attr_accessor :run

        def run=(value)
            @run = value
        end

        def initialize(run)
            self.run = run
        end
    end

    class Macrobutton < Alias
        attr_accessor :id

        def id=(value)
            @id = value
        end

        def initialize(run, index)
            super(run)
            self.id = index
        end

        def setter(set, mode)
            raise BaseErrors::ValueTypeError.new(set,'bool') unless @run.is_a_bool?(set)
            if [false,true].include? set
                set = @run.bool_to_float(set)
            end
            @run.macro_setstatus(@id, set, mode)
        rescue BaseErrors => error
            puts "#{error.class}: #{error.message} in #{__callee__}"
            raise
        end

        def getter(mode)
            return !@run.macro_getstatus(@id, mode).zero?
        end

        def state=(value)
            self.setter(value, mode=1)
        end

        def state(value = nil)
            return self.getter(mode=1) if value.nil?
            self.state = value
        end

        def stateonly=(value)
            self.setter(value, mode=2)
        end

        def stateonly(value = nil)
            return self.getter(mode=2) if value.nil?
            self.stateonly = value
        end

        def trigger=(value)
            self.setter(value, mode=3)
        end

        def trigger(value = nil)
            return self.getter(mode=3) if value.nil?
            self.trigger = value
        end
    end

    class Recorder < Alias
        def initialize(run)
            super
        end

        def setter(command, value = nil)
            command.chomp!('=')
            raise BaseErrors::ValueTypeError.new(value,'bool') unless @run.is_a_bool?(value)
            if [false,true].include? value
                value = @run.bool_to_float(value)
            end
            if value
                @run.set_parameter("recorder.#{command}", value)
            else
                @run.set_parameter("recorder.#{command}", 1.0)
            end
        rescue BaseErrors => error
            puts "#{error.class}: #{error.message} in #{__callee__}"
            raise
        end

        def getter(command)
            return !@run.get_parameter("recorder.#{command}").zero?
        end

        def play
            self.setter(__method__.to_s)
        end

        def stop
            self.setter(__method__.to_s)
        end

        def record
            self.setter(__method__.to_s)
        end

        def ff
            self.setter(__method__.to_s)
        end

        def rew
            self.setter(__method__.to_s)
        end

        def A1=(value)
            self.setter(__method__.to_s, value)
        end

        def A1(value = nil)
            return self.getter(__method__.to_s) if value.nil?
            self.A1 = value
        end

        def A2=(value)
            self.setter(__method__.to_s, value)
        end

        def A2(value = nil)
            return self.getter(__method__.to_s) if value.nil?
            self.A2 = value
        end

        def A3=(value)
            self.setter(__method__.to_s, value)
        end

        def A3(value = nil)
            return self.getter(__method__.to_s) if value.nil?
            self.A3 = value
        end

        def A4=(value)
            self.setter(__method__.to_s, value)
        end

        def A4(value = nil)
            return self.getter(__method__.to_s) if value.nil?
            self.A4 = value
        end

        def A5=(value)
            self.setter(__method__.to_s, value)
        end

        def A5(value = nil)
            return self.getter(__method__.to_s) if value.nil?
            self.A5 = value
        end

        def B1=(value)
            self.setter(__method__.to_s, value)
        end

        def B1(value = nil)
            return self.getter(__method__.to_s) if value.nil?
            self.B1 = value
        end

        def B2=(value)
            self.setter(__method__.to_s, value)
        end

        def B2(value = nil)
            return self.getter(__method__.to_s) if value.nil?
            self.B2 = value
        end

        def B3=(value)
            self.setter(__method__.to_s, value)
        end

        def B3(value = nil)
            return self.getter(__method__.to_s) if value.nil?
            self.B3 = value
        end
    end

    class Vban < Alias
        attr_accessor :id, :direction

        def id=(value)
            @id = value
        end

        def direction=(value)
            @direction = value
        end

        def initialize(run, index, dir)
            super(run)
            self.id = index
            self.direction = dir
        end

        def setter(command, value)
            command.chomp!('=')
            if [false,true].include? value
                value = @run.bool_to_float(value)
            end
            @run.set_parameter("vban.#{@direction}stream[#{@id}].#{command}", value)
        end

        def getter(command)
            if @run.is_bool.include? command
                val = @run.get_parameter("vban.#{@direction}stream[#{@id}].#{command}")
                return !val.zero?
            end
            @run.get_parameter("vban.#{@direction}stream[#{@id}].#{command}")
        end

        def on=(value)
            self.setter(__method__.to_s, value)
        end

        def on(value = nil)
            return self.getter(__method__.to_s) if value.nil?
            self.on = value
        end

        def name=(value)
            self.setter(__method__.to_s, value)
        end

        def name
            return self.getter(__method__.to_s)
        end

        def ip=(value)
            self.setter(__method__.to_s, value)
        end

        def ip
            return self.getter(__method__.to_s)
        end

        def port=(value)
            self.setter(__method__.to_s, value)
        end

        def port
            return self.getter(__method__.to_s)
        end

        def sr=(value)
            raise IOError::WriteError if self.direction == "in"
            self.setter(__method__.to_s, value)
        rescue IOError => error
            puts "#{error.class}: #{error.message} in #{__callee__}"
            raise
        end

        def sr
            return self.getter(__method__.to_s)
        end

        def channel=(value)
            raise IOError::WriteError if self.direction == "in"
            self.setter(__method__.to_s, value)
        rescue IOError => error
            puts "#{error.class}: #{error.message} in #{__callee__}"
            raise
        end

        def channel
            return self.getter(__method__.to_s)
        end

        def bit=(value)
            raise WriteError if self.direction == "in"
            self.setter(__method__.to_s, value == 16 ? 1 : 2)
        rescue WriteError => error
            puts "#{error.class}: #{error.message} in #{__callee__}"
            raise
        end

        def bit
            return self.getter(__method__.to_s) == 1 ? 16 : 24
        end

        def quality=(value)
            self.setter(__method__.to_s, value)
        rescue WriteError => error
            puts "#{error.class}: #{error.message} in #{__callee__}"
            raise
        end

        def quality
            return self.getter(__method__.to_s)
        end

        def route=(value)
            self.setter(__method__.to_s, value)
        rescue WriteError => error
            puts "#{error.class}: #{error.message} in #{__callee__}"
            raise
        end

        def route
            return self.getter(__method__.to_s)
        end
    end

    class Command < Alias
        def initialize(run)
            super
        end

        def setter(command, value = nil, delay = @run.saveloaddelay)
            command.chomp!('=')
            command[0] = command[0].capitalize
            @run.sp_command = command
            if value.nil?
                @run.set_parameter(@run.sp_command, 1.0)
            else
                @run.sp_value = value
                @run.set_parameter(@run.sp_command, @run.sp_value)
                sleep(delay)
            end
        end

        def shutdown
            self.setter(__method__.to_s)
            sleep(@run.shutdowndelay)
        end

        def show
            self.setter(__method__.to_s)
        end

        def restart
            self.setter(__method__.to_s)
        end

        def eject
            self.setter(__method__.to_s)
        end

        def reset
            self.setter(__method__.to_s)
        end

        def save(value, delay = @run.saveloaddelay)
            self.setter(__method__.to_s, value, delay)
        end

        def load(value, delay = @run.saveloaddelay)
            self.setter(__method__.to_s, value, delay)
        end

        def showvbanchat
            self.setter("DialogShow.VBANCHAT")
        end
    end
end
