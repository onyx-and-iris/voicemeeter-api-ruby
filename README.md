# Ruby Wrapper for Voicemeeter API
The purpose of this wrapper is to provide an easy-to-use, flexible layer of
abstraction over the C API provided with the Voicemeeter virtual mixing console.

This wrapper is still being worked on, for an outline of future changes refer to:
[Project CHANGELOG](CHANGELOG.md)

## Tested against
- Basic 1.0.7.8
- Banana 2.0.5.8
- Potato 3.0.1.8

You may have success with many commands in earlier versions but some commands 
(example Macrobuttons) were only added to the API in later releases.

## Requirements
- Voicemeeter: https://voicemeeter.com/
- Ruby 2.3 or greater

## Installation
### Bundler
If you only want the wrapper then:
```
Bundle install --without development
```
If you want to run test units then:
```
Bundle install --with development
```
### Gem
Manually install wrapper from your shell:
```
gem install voicemeeter_api_ruby
```
And with development dependencies (test files only on github):
```
gem install voicemeeter_api_ruby --development
```
## Use
Simplest use case, pass a block, for example:
```ruby
require 'routines'
vmr = Remote.new("basic")

OFF = 0
ON = 1

# pass a block to vmr.run
vmr.run do
    # Set strip furthest to the left mute ON
    vmr.strip[1].mute = true
    puts vmr.strip[1].mute  '=> true'
    # If you find this more verbose you may pass an argument value
    vmr.strip[2].mute(ON)
    puts vmr.strip[2].mute  '=> true'
end
```
When passing a block, login and logout routines are handled for you.

Remote may be instantiated with a Voicemeeter type argument, in which case the 
wrapper will attempt to load that Voicemeeter type if it isn't currently running. 
Voicemeeter type may be one of:
- basic
- banana
- potato

If you wish to login/logout manually you may run them independently but you MUST
call login once at the start of your program, then logout once at the end of your 
program. Login may be called with a keyword argument:
```ruby
require 'routines'
# Login with a keyword argument; logmein
vmr = Remote.new("banana", logmein: true)

# Set strip second from the left A3 ON
vmr.strip[2].A3 = true
puts vmr.strip[2].A3    '=> true'
# Set bus second from the left, mono OFF
vmr.bus[2].mono = false
puts vmr.bus[2].mono    '=> false'

# Call logout once at the end of your program
vmr.logout
```
If you know for sure that Voicemeeter is already running you may omit the
Voicemeeter type when you call Remote, for example:
```ruby
require 'routines'
# no type passed as argument
vmr = Remote.new

vmr.run do
    vmr.strip[1].A1 = true
    vmr.bus[3].EQ = true

    vmr.vban_in[3].enable = false
    vmr.vban_out[1].enable = true
end
```
In this case the wrapper will determine the type from the running instance
of Voicemeeter and build the console layout accordingly.

All alias functions use a base 1 index meaning the strips and buses furthest to
the left are defined as strip[1], bus[1] and increment rightwards. If you prefer
to use a base 0 index you may pass a keyword argument base_0, for example:
```ruby
require 'routines'
vmr = Remote.new("potato", base_0: true)

vmr.run do
    # Set strip furthest to the left label name
    vmr.strip[0].label = 'my_strip_name'
    puts vmr.strip[0].label '=> my_strip_name'

    # Set top left macrobutton state only ON
    vmr.button[0].stateonly = true
    # Set vban outstream strip nearest to the top ON
    vmr.vban_out[0].enable = true
end
```
As you see, the same applies to macrobutton and vban instream/outstream methods.

Set many strip/bus parameters at once by passing set_multi a hash, for example:
```ruby
require 'routines'
vmr = Remote.new

OFF = 0
ON = 1
# using a base 1 index by default
vmr.run do
  vmr.set_multi({
      :strip_1 => {"mute" => ON, "gain" => 3.2, "A1" => ON},
      :strip_2 => {"mute" => true, "gain" => -4.8, "A1" => true},
      :strip_3 => {"mute" => ON, "gain" => 0.0, "A1" => ON},
      :bus_1 => {"mute" => true, "gain" => -3.3, "mono" => true},
      :bus_2 => {"mute" => ON, "gain" => 8.6, "mono" => ON},
  })

  vmr.set_multi({
      :strip_1 => {"mute" => false, "gain" => 0.0, "A1" => false},
      :strip_2 => {"mute" => OFF, "gain" => -2.1, "A1" => OFF},
      :strip_3 => {"mute" => false, "gain" => 3.0, "A1" => false},
      :bus_1 => {"mute" => OFF, "gain" => -8.3, "mono" => OFF},
      :bus_2 => {"mute" => false, "gain" => 10.6, "mono" => false},
  })
end
```
Again, using true, false, 1 and 0 interchangeably.

## Available commands
### Strip|Bus
Following commands work for both strips and buses.
- gain range (-60, 12)

```ruby
vmr.strip[4].mono = true
vmr.strip[4].mute = true
vmr.strip[4].gain = 3.6

vmr.bus[5].mono = false
vmr.bus[5].mute = false
vmr.bus[5].gain = -2.0
```
### Strip
Following commands work only for strips
- mc, k replace mono at different strips locations for each Voicemeeter type.
- comp, gate range (0, 10)
- limit range (-40, 12)

```ruby
vmr.strip[1].solo = true

vmr.strip[1].comp = 1.2
puts vmr.strip[1].comp  '=> 1.2'

vmr.strip[1].gate = 2.5
puts vmr.strip[1].gate  '=> 2.5'

vmr.strip[1].limit = -6
puts vmr.strip[1].limit '=> -6'

vmr.strip[4].mc = true
vmr.strip[5].k = true

vmr.strip[1].A1 = true
vmr.strip[2].A2 = true
vmr.strip[3].A3 = true
vmr.strip[4].A4 = true
vmr.strip[5].A5 = true
vmr.strip[6].B1 = false
vmr.strip[7].B2 = false
vmr.strip[8].B3 = false
```
### Bus
Following commands work only for buses
```ruby
vmr.bus[1].EQ = true
```


### Macrobuttons
Three modes defined: state, stateonly and trigger.
- State runs associated scripts
- Stateonly does not run associated scripts
- Index range (1, 70)

```ruby
require 'routines'
vmr = Remote.new

OFF = 0
ON = 1

vmr.run do
  vmr.button[3].state = true
  vmr.button[3].state(ON)

  vmr.button[4].stateonly = true
  vmr.button[4].stateonly(ON)

  vmr.button[5].trigger = false
  vmr.button[5].trigger(OFF)
end
```

### Recorder
```ruby
require 'routines'
vmr = Remote.new

OFF = 0
ON = 1

vmr.run do
  vmr.recorder.record
  vmr.recorder.stop
  vmr.recorder.play
  vmr.recorder.ff
  vmr.recorder.rew

  # Set the output channels
  vmr.recorder.A1(ON)
  vmr.recorder.A2(ON)
  vmr.recorder.A3 = true
  vmr.recorder.B1(OFF)
  vmr.recorder.B2 = false
end
```

### VBAN
```ruby
require 'routines'
vmr = Remote.new("potato", logmein: true)

OFF = 0
ON = 1

# Enable VBAN
vmr.vban = true

# Set instream nearest the top ON and instream third from top OFF
vmr.vban_in[1].enable = true
vmr.vban_in[3].enable = false

# Set outstream nearest the top ON and outstream third from top OFF
vmr.vban_out[1].enable(ON)
vmr.vban_out[3].enable(OFF)

# Set instream fifth from the top name and outstream seventh from the top name
vmr.vban_in[5].name = "my_stream_name"
vmr.vban_out[7].name = "my_other_stream_name"

# Disable VBAN
vmr.vban = false

vmr.logout
```
### Special
Certain 'special' commands are defined by the API as performing actions rather
than setting values. You may invoke them with the following commands:
```ruby
# Bring Voicemeeter to the foreground
vmr.command.show
# Resets parameters to default install state
vmr.command.reset
# Restarts the audio engine
vmr.command.restart
# Shut down Voicemeeter application entirely
vmr.command.shutdown


# Loads a config file named test2.xml in default config directory
vmr.command.load('test2.xml')
# Saves a config file named save0.xml in default config directory
vmr.command.save('save0.xml')
```


### Run tests
To see a list of available tests run:
```
Bundle exec rake --tasks
```
Then, for example, if you wish to run tests for Voicemeeter type basic,
test type pass:
```
Bundle exec rake basic:pass
```

runmany.ps1 can be used to run many instances of a certain task type.
For example:
```
.\runmany.ps1 10 -t 'basic' -p
```
Will execute 10 times `Bundle exec rake basic:pass`

error type tests can be defined by string argument, for example:
```
.\runmany.ps1 5 -t 'banana' -e 'other'
```
Will execute 5 times `Bundle exec rake banana:errors:other`

Results will be logged to the directory of the Voicemeeter type tested.
To clean up files after tests run:
- Cleanup everything `Bundle exec rake cleanup:all`
- Cleanup logs `Bundle exec rake cleanup:logs`
- Truncate summary files `Bundle exec rake cleanup:summary`


### Contribute
If you wish to contribute please target the dev branch and include any relevant
tests. Thank you.
