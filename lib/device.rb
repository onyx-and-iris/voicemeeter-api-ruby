require_relative 'iremote'
require_relative 'meta'

class Device
    def initialize(remote)
        @remote = remote
    end

    def getter(index = nil, direction = nil)
        return @remote.get_num_devices(direction) if index.nil?

        vals = @remote.get_device_description(index, direction)
        types = { 1 => 'mme', 3 => 'wdm', 4 => 'ks', 5 => 'asio' }
        { 'name': vals[0], 'type': types[vals[1]], 'id': vals[2] }
    end

    def ins() = getter(index = nil, direction = 'in')

    def outs() = getter(index = nil, direction = 'out')

    def input(i) = getter(index = i, direction = 'in')

    def output(i) = getter(index = i, direction = 'out')
end
