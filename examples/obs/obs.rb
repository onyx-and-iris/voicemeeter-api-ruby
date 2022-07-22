require "voicemeeter"
require "obs/websocket"
require "socket"
require "uri"
require "websocket/driver"
require "toml"

class Main
  def run(vm, uri, password)
    connect(URI.parse(uri))

    # To initialize OBS::WebSocket, pass a WebSocket connection.
    obs = OBS::WebSocket::Client.new(@driver)

    obs.on_open do
      obs.authenticate!(password).value!

      # Request methods return Future values that can be waited for by `value!`.
      version = obs.get_version.value!
      puts "Logged into OBS successfully!"
      puts "OBS version: #{version.obs_studio_version}; OBS-websocket version: #{version.obs_websocket_version}"
    end

    # Listen for events using `on_*` methods. The event payload is yielded to the block.
    obs.on_switch_scenes do |ev|
      scene = ev.scene_name
      puts "Switched to scene #{scene}"

      case scene
      when "START"
        vm.strip[0].mute = true
        vm.strip[1].B1 = true
        vm.strip[2].B2 = true
      when "LIVE"
        vm.strip[0].mute = false
        vm.strip[7].A3 = true
        vm.strip[7].fadeto(-6, 500)
        vm.vban.instream[0].on = True
      when "BRB"
        vm.strip[0].mute = false
        vm.strip[5].A1 = true
        vm.strip[5].A2 = true
        vm.strip[7].fadeto(0, 500)
      when "END"
        vm.apply(
          {
            strip_0: {
              mute: true
            },
            strip_1: {
              mute: true,
              B1: false
            },
            strip_2: {
              mute: true,
              B1: false
            },
            vban_instream_0: {
              on: false
            }
          }
        )
        obs.close
      end
    end

    obs.on_close(executor: :immediate) do |code, reason|
      puts "Logged out of OBS! (code: #{code})"
    end

    start_driver
  end

  private

  def connect(uri)
    fail ArgumentError, "Only supports ws:// URI" unless uri.scheme == "ws"

    @socket = TCPSocket.new(uri.host, uri.port || 80)
    @driver = WebSocket::Driver.client(SocketWrapper.new(uri.to_s, @socket))
  end

  def start_driver
    @driver.start

    loop do
      @driver.parse(@socket.readpartial(4096))
    rescue EOFError
      break
    end
  end

  class SocketWrapper
    def initialize(url, socket)
      @url = url
      @socket = socket
    end

    attr_reader :url

    def write(s)
      @socket.write(s)
    end
  end
end

if $0 == __FILE__
  config = Hash.new
  toml_file = File.join(Dir.pwd, "config.toml")
  config = TOML::Parser.new(File.read(toml_file)).parsed
  host = config["connection"]["host"]
  port = config["connection"]["port"]
  pass = config["connection"]["pass"]

  kind_id = "potato"

  # start Voicemeeter GUI
  Voicemeeter.start(kind_id)

  vm = Voicemeeter.remote(kind_id)

  vm.run { Main.new.run(vm, "ws://#{host}:#{port}", "#{pass}") }
end
