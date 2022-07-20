## Requirements

-   [OBS Studio](https://obsproject.com/)
-   [OBS Websocket Plugin](https://obsproject.com/forum/resources/obs-websocket-remote-control-obs-studio-from-websockets.466/)
-   [OBS Websocket Ruby](https://github.com/onyx-and-iris/ruby-obs-websocket)
-   [TOML parser for Ruby](https://github.com/jm/toml)
-   [Websocket Driver](https://github.com/faye/websocket-driver-ruby)

## About

A simple demonstration showing how to sync OBS scene switches to Voicemeeter states. The script assumes you have connection info saved in
a config toml file named `config.toml` placed next to `obs.rb`. It also assumes you have scenes named `START` `BRB` `END` and `LIVE`.

A valid `config.toml` file might look like this:

```toml
[connection]
host = "localhost"
port = 4444
pass = "mystrongpass"
```
