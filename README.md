[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://github.com/onyx-and-iris/voicemeeter-api-ruby/blob/dev/LICENSE)
[![code style: prettier](https://img.shields.io/badge/code_style-prettier-ff69b4.svg?style=flat-square)](https://github.com/prettier/plugin-ruby)
![tests: failed count](https://img.shields.io/badge/dynamic/json?color=blue&label=tests&query=summary.failure_count&suffix=%20failed&url=https%3A%2F%2Fraw.githubusercontent.com%2Fonyx-and-iris%2Fvoicemeeter-api-ruby%2Fdev%2Fspec%2Frspec.json)
[![Gem Version](https://badge.fury.io/rb/voicemeeter_api_ruby.svg)](https://badge.fury.io/rb/voicemeeter_api_ruby)
![](https://ruby-gem-downloads-badge.herokuapp.com/voicemeeter_api_ruby?type=total&color=red)

# Ruby Wrapper for Voicemeeter API

This gem offers a Ruby interface for the Voicemeeter Remote C API.

For an outline of past/future changes refer to: [CHANGELOG](CHANGELOG.md)

## Tested against

-   Basic 1.0.8.2
-   Banana 2.0.6.2
-   Potato 3.0.2.2

## Requirements

-   [Voicemeeter](https://voicemeeter.com/)
-   Ruby 3.0 or greater

## Installation

### Bundler

Put this in your Gemfile:

`gem 'voicemeeter_api_ruby'`

### Gem

Install voicemeeter_api_ruby gem from your console

`gem install 'voicemeeter_api_ruby'`

## `Use`

Simplest use case, request a Remote class of a kind, then pass a block to run.

Login and logout are handled for you in this scenario.

#### `main.rb`

```ruby
require 'voicemeeter'

kind_id = 'banana'

# start Voicemeeter GUI
Voicemeeter.start(kind_id)

vm = Voicemeeter.remote(kind_id)

# vm.run accepts a block
vm.run do
    # mute the leftmost strip
    vm.strip[0].mute = true
    puts vm.strip[0].mute

    # disable eq for second from left bus
    vm.bus[1].eq = false
    puts vm.bus[1].eq
end
```

Otherwise you must remember to call `vm.login` `vm.logout` at the start/end of your code.

## `kind_id`

Pass the kind of Voicemeeter as an argument. kind_id may be:

-   `basic`
-   `banana`
-   `potato`

## `Available commands`

### Strip

The following properties are available.

-   `mono`: boolean
-   `solo`: boolean
-   `mute`: boolean
-   `gain`: float, from -60.0 to 12.0
-   `comp`: float, from 0.0 to 10.0
-   `gate`: float, from 0.0 to 10.0
-   `audibility`: float, from 0.0 to 10.0
-   `limit`: int, from -40 to 12
-   `A1 - A5`, `B1 - B3`: boolean
-   `label`: string
-   `device`: string
-   `sr`: int
-   `mc`: boolean
-   `k`: int, from 0 to 4
-   `bass`: float, from -12.0 to 12.0
-   `mid`: float, from -12.0 to 12.0
-   `treble`: float, from -12.0 to 12.0

example:

```ruby
vm.strip[3].gain = 3.7
puts vm.strip[0].label
```

The following methods are available.

-   `appgain(name, value)`: string, float, from 0.0 to 1.0

Set the gain in db by value for the app matching name.

-   `appmute(name, value)`: string, bool

Set mute state as value for the app matching name.

example:

```ruby
vm.strip[5].appgain('Spotify', 0.5)
vm.strip[5].appmute('Spotify', true)
```

##### Gainlayers

-   `gain`: float, from -60.0 to 12.0

example:

```ruby
vm.strip[3].gainlayer[3].gain = 3.7
```

Gainlayers are defined for potato version only.

##### Levels

The following properties are available.

-   `prefader`
-   `postfader`
-   `postmute`

example:

```ruby
puts vm.strip[3].levels.prefader
```

Level properties will return -200.0 if no audio detected.

### Bus

The following properties are available.

-   `mono`: boolean
-   `mute`: boolean
-   `eq`: boolean
-   `eq_ab`: boolean
-   `sel`: boolean
-   `gain`: float, from -60.0 to 12.0
-   `label`: string
-   `device`: string
-   `sr`: int

example:

```ruby
vm.bus[3].gain = 3.7
puts vm.bus[0].label

vm.bus[4].mono = true
```

##### Modes

-   `normal`: boolean
-   `amix`: boolean
-   `bmix`: boolean
-   `composite`: boolean
-   `tvmix`: boolean
-   `upmix21`: boolean
-   `upmix41`: boolean
-   `upmix61`: boolean
-   `centeronly`: boolean
-   `lfeonly`: boolean
-   `rearonly`: boolean

example:

```ruby
vm.bus[4].mode.amix = true
```

##### Levels

The following properties are available.

-   `all`

example:

```ruby
puts vm.bus[0].levels.all
```

`levels.all` will return -200.0 if no audio detected.

### Strip | Bus

The following methods are Available

-   `fadeto(amount, time)`: float, int
-   `fadeby(amount, time)`: float, int

Modify gain to or by the selected amount in db over a time interval in ms.

example:

```ruby
vm.strip[0].fadeto(-10.3, 1000)
vm.bus[3].fadeby(-5.6, 500)
```

### Macrobuttons

Three modes defined: state, stateonly and trigger.

-   `state`: boolean
-   `stateonly`: boolean
-   `trigger`: boolean

example:

```ruby
vm.button[37].state = true
vm.button[55].trigger = false
```

### Recorder

The following properties accept boolean values.

-   `loop`: boolean
-   `A1 - A5`: boolean
-   `B1 - A3`: boolean

The following methods are Available

-   `play`
-   `stop`
-   `pause`
-   `record`
-   `ff`
-   `rew`
-   `load(filepath)`: string

example:

```ruby
vm.recorder.play
vm.recorder.stop

# Enable loop play
vm.recorder.loop = True

# Disable recorder out channel B2
vm.recorder.B2 = False

# filepath as string
vm.recorder.load('C:\music\mytune.mp3')
```

### VBAN

-   `vm.vban.enable` `vm.vban.disable` Turn VBAN on or off

##### Instream | Outstream

The following properties are available.

-   `on`: boolean
-   `name`: string
-   `ip`: string
-   `port`: int, range from 1024 to 65535
-   `sr`: int, (11025, 16000, 22050, 24000, 32000, 44100, 48000, 64000, 88200, 96000)
-   `channel`: int, from 1 to 8
-   `bit`: int, 16 or 24
-   `quality`: int, from 0 to 4
-   `route`: int, from 0 to 8

SR, channel and bit are defined as readonly for instreams. Attempting to write to those parameters will throw an error. They are read and write for outstreams.

example:

```ruby
# turn VBAN on
vm.vban.enable

# turn on vban instream 0
vm.vban.instream[0].on = True

# set bit property for outstream 3 to 24
vm.vban.outstream[3].bit = 24
```

### Command

Certain 'special' commands are defined by the API as performing actions rather than setting values. The following methods are available:

-   `show` : Bring Voiceemeter GUI to the front
-   `shutdown` : Shuts down the GUI
-   `restart` : Restart the audio engine

The following properties are write only and accept boolean values.

-   `showvbanchat`: boolean
-   `lock`: boolean

example:

```ruby
vm.command.restart
vm.command.showvbanchat = true
```

### Device

-   `ins` `outs` : Returns the number of input/output devices
-   `input(i)` `output(i)` : Returns a hash of device properties for device[i]

example:

```ruby
vm.run { (0...vm.device.ins).each { |i| puts vm.device.input(i) } }
```

### Multiple parameters

-   `set_multi`
    Set many strip/bus/macrobutton/vban parameters at once, for example:

```ruby
vm.set_multi(
    {
        strip_0: {
            mute: true,
            gain: 3.2,
            A1: true,
        },
        bus_3: {
            gain: -3.2,
            eq: true,
        },
        button_39: {
            stateonly: true,
        },
        vban_outstream_3: {
            on: true,
            bit: 24,
        },
    },
)
```

Or for each class you may do:

```ruby
vm.strip[0].set_multi(mute: true, gain: 3.2, A1: true)
vm.vban.outstream[0].set_multi(on: true, name: 'streamname', bit: 24)
```

## Config Files

`vm.apply_config(<configname>)`

You may load config files in TOML format.
Three example configs have been included with the package. Remember to save
current settings before loading a config. To set one you may do:

```ruby
require 'voicemeeter'
vm = Voicemeeter.remote('banana')
vm.run { vm.apply_config('example') }
```

will load a config file at mydir/configs/banana/example.toml for Voicemeeter Banana.

## `Voicemeeter Module`

### Remote class

Access to lower level Getters and Setters are provided with these functions:

-   `vm.get(param, string=false)`: For getting the value of any parameter. Set string to true if getting a property value expected to return a string.
-   `vm.set(param, value)`: For setting the value of any parameter.

Access to lower level polling functions are provided with these functions:

-   `vm.pdirty?`: Returns true if a parameter has been updated.
-   `vm.mdirty?`: Returns true if a macrobutton has been updated.

example:

```ruby
vm.get('Strip[2].Mute')
vm.set('Strip[4].Label', 'stripname')
vm.set('Strip[0].Gain', -3.6)
```

#### Voicemeeter::start

Use this function to start Voicemeeter of a kind independently of Remote class.
for example:

```ruby
require 'voicemeeter'
Voicemeeter.start('banana')
```

### Run tests

To run all tests:

```
Bundle exec rspec
```

You can use tags to run only certain tests, for example:

```
Bundle exec rspec --tag 'higher'
```

### Official Documentation

-   [Voicemeeter Remote C API](https://github.com/onyx-and-iris/Voicemeeter-SDK/blob/main/VoicemeeterRemoteAPI.pdf)
