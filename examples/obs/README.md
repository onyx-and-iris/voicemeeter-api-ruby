## Requirements

-   [OBS Studio](https://obsproject.com/)
-   [OBS Websocket Plugin](https://github.com/obsproject/obs-websocket/releases/tag/5.0.0)
-   [OBS Websocket Ruby](https://github.com/hanazuki/ruby-obs-websocket)
-   [TOML parser for Ruby](https://github.com/jm/toml)
-   [Websocket Driver](https://github.com/faye/websocket-driver-ruby)

## About

A simple demonstration showing how to sync OBS scene switches to Voicemeeter states.

OBS developers intend to include obs-websocket v5 from OBS Studio v28 onwards.

## Use

The script assumes you have connection info saved in a config toml file named `config.toml` placed next to `obs.rb`. It also assumes you have scenes named `START` `BRB` `END` and `LIVE`.

A valid `config.toml` file might look like this:

```toml
[connection]
host = "localhost"
port = 4455
pass = "mystrongpass"
```
