require_relative "meta"
require_relative "errors"

class IRemote
  "
  Common interface between base class and higher classes.
  "
  include Meta_Functions

  def initialize(remote, i = nil)
    @remote = remote
    @index = i
  end

  def getter(param, is_string = false)
    @remote.get_parameter("#{self.identifier}.#{param}", is_string)
  end

  def setter(param, value)
    @remote.set_parameter("#{self.identifier}.#{param}", value)
  end

  def identifier
    raise "Called abstract method: identifier"
  end

  def set_multi(param_hash)
    param_hash.each { |(key, val)| self.send("#{key}=", val) }
  end

  alias_method "apply", :set_multi
end
