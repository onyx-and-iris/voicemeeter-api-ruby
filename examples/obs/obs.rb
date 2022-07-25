require "voicemeeter"
require "obs/websocket"
require "socket"
require "uri"
require "websocket/driver"
require "toml"

class Main
  def run(vm, uri, password = nil)
    connect(URI.parse(uri))

    tracer = Tracer.new if ENV.key?("TRACE")

    # To initialize OBS::WebSocket, pass a WebSocket connection,
    # and optionally a tracer for debugging.
    obs = OBS::WebSocket::Client.new(@driver, tracer: tracer)

    # If the server requires authentication, set the password before starting communication.
    obs.password = password

    # Once the client is identified by the server, the handlers registered with `on_open` are called back.
    obs.on_open do
      # The request methods return Future values that can be waited for by `value!`.
      version = obs.get_version.value!
      puts "OBS version: #{version.obs_version}; OBS-websocket version: #{version.obs_web_socket_version}"
    rescue => e
      $stderr.puts e.message
      exit! 1
    end

    # Listen for events using `on_*` methods. The event payload is yielded to the block.
    obs.on_current_program_scene_changed do |ev|
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

    # When the connection is closed by the server, the handlers registered to `on_close` are called back
    # with the error code and human-readable message.
    obs.on_close(executor: :immediate) do |code, reason|
      puts "Bye! (code: #{code}; reason: #{reason})"
      exit 1 if code != 1000
    end

    # Now start the websocket driver to begin the communication with the server.
    start_driver
  end

  private

  def connect(uri)
    fail ArgumentError, "Only supports ws:// URI" unless uri.scheme == "ws"

    @socket = TCPSocket.new(uri.host, uri.port || 80)
    @driver = WebSocket::Driver.client(SocketWrapper.new(uri, @socket))
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
      @url = url.to_s
      @socket = socket
    end

    attr_reader :url

    def write(s)
      @socket.write(s)
    end
  end

  class Tracer
    def send_message(msg)
      $stderr.puts ">> #{msg}"
    end

    def receive_message(msg)
      $stderr.puts "<< #{msg}"
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
