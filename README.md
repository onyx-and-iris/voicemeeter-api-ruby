# Ruby Wrapper for Voicemeeter API
The purpose of this wrapper is to provide an easy-to-use, flexible layer of
abstraction over the C API provided with the Voicemeeter virtual mixing console.

This wrapper is still being worked on, for an outline of future changes refer to:
[CHANGELOG](CHANGELOG.md)

## Tested against
- Basic 1.0.8.1
- Banana 2.0.6.1
- Potato 3.0.2.1

## Requirements
- Voicemeeter: https://voicemeeter.com/
- Ruby 2.7 or greater

## Installation
### Gem
Install voicemeeter_api_ruby gem from your console

`gem install voicemeeter_api_ruby`

### Bundler
Put this in your Gemfile:

`gem 'voicemeeter_api_ruby', require: false`

or use bundlers built in git functionality:

`gem "voicemeeter_api_ruby", :git => "git://github.com/onyx-and-iris/voicemeeter-api-ruby"`


## Use
Simplest use case, pass a block, for example:
```ruby
require 'voicemeeter'
vmr = Voicemeeter.remote("banana")

# vmr.run accepts a block
vmr.run do
    # mute the leftmost strip
    vmr.strip[0].mute = true
    puts vmr.strip[0].mute  '=> true'

    # disable eq for second from left bus
    vmr.bus[1].eq = false
    puts vmr.bus[1].eq  '=> false'
end
```
When passing a block, login and logout are handled for you.

## Voicemeeter.remote(kind)
Pass the kind of voicemeeter as an argument. Kind may be:
- `basic`
- `banana`
- `potato`

## Available commands
### Channels (strip/bus)
The following properties exist for audio channels.
- `mono`: boolean
- `mute`: boolean
- `gain`: float, from -60 to 12
- `mc`, `k`: boolean
- `comp`, `gate`: float, from 0 to 10
- `limit`: int, from -40 to 12
- `A1 - A5`, `B1 - B3`: boolean
- `eq`: boolean
- `label`: string
- `device`: string
- `sr`: int

example:
```ruby
    vmr.strip[3].gain = 3.7
    puts strip[0].label

    vmr.bus[4].mono = true
```

### Macrobuttons
Three modes defined: state, stateonly and trigger.
- `state`: boolean
- `stateonly`: boolean
- `trigger`: boolean

example:
```ruby
    vmr.button[37].state = true
    vmr.button[55].trigger = false
```

### Recorder
The following methods are Available
- `play`
- `stop`
- `pause`
- `record`
- `ff`
- `rew`
The following properties accept boolean values.
- `loop`: boolean
- `A1 - A5`: boolean
- `B1 - A3`: boolean
Load accepts a string:
- `load`: string

example:
```ruby
    vmr.recorder.play
    vmr.recorder.stop

    # Enable loop play
    vmr.recorder.loop = True
    # Disable recorder out channel B2
    vmr.recorder.B2 = False

    # filepath as string
    vmr.recorder.load('C:\music\mytune.mp3')
```

### VBAN
- `vmr.vban.enable` `vmr.vban.disable` Turn VBAN on or off

For each vban in/out stream the following properties are defined:
- `on`: boolean
- `name`: string
- `ip`: string
- `port`: int, range from 1024 to 65535
- `sr`: int, (11025, 16000, 22050, 24000, 32000, 44100, 48000, 64000, 88200, 96000)
- `channel`: int, from 1 to 8
- `bit`: int, 16 or 24
- `quality`: int, from 0 to 4
- `route`: int, from 0 to 8

SR, channel and bit are defined as readonly for instreams. Attempting to write to those parameters will throw an error. They are read and write for outstreams.

example:
```ruby
    # turn VBAN on
    vmr.vban.enable
    # turn on vban instream 0
    vmr.vban.instream[0].on = True
    # set bit property for outstream 3 to 24
    vmr.vban.outstream[3].bit = 24
```

### Command
Certain 'special' commands are defined by the API as performing actions rather than setting values. The following methods are available:

- `show` : Bring Voiceemeter GUI to the front
- `shutdown` : Shuts down the GUI
- `restart` : Restart the audio engine

The following properties are write only and accept boolean values.
- `showvbanchat`: boolean
- `lock`: boolean

example:
```ruby
    vmr.command.restart
    vmr.command.showvbanchat = true
```

### Multiple parameters
- `vmr.set_multi`
Set many parameters at once using a hash, for example:
```ruby
    vmr.set_multi({
        :strip_0 => {
            :mute => true, :gain => 3.2, :A1 => true,
        },
        :bus_3 => {
            :gain => -3.2, :eq => true,
        },
        :button_39 => {
            :stateonly => true,
        },
        :vban_outstream_3 => {
            :on => true, :bit => 24,
        },
    })
```

### Run tests
To see a list of available tests run:
```
Bundle exec rake --tasks
```
Then, for example, if you wish to run higher tests, type pass:
```
Bundle exec rake higher:pass
```
