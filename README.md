# Ruby Wrapper for Voicemeeter API
The purpose of this wrapper is to provide an easy-to-use flexible layer of
abstraction over the C API provided with the Voicemeeter virtual mixing console.

## Tested against
- Basic 1.0.7.8
- Banana 2.0.5.8
- Potato 3.0.1.8

## Requirements
- Ruby 2.7 or greater

## Installation
### Bundler
If you only want the wrapper then:
```
Bundle install --without test
```
If you want to run test units then:
```
Bundle install -with test
```

## Use
Simplest use case, pass a block argument, for example:
```ruby
require 'routines'
vmr = Remote.new("basic")

OFF = 0
ON = 1

vmr.run do
    # Set strip furthest to the left mute ON, and then OFF
    vmr.strip[1].mute = true
    puts vmr.strip[1].mute
    vmr.strip[1].mute = false
    puts vmr.strip[1].mute

    # If you find this more verbose you may pass an argument value
    vmr.strip[2].mute(ON)
    puts vmr.strip[2].mute
    vmr.strip[2].mute(OFF)
    puts vmr.strip[2].mute
end
```
When using a block argument login and logout routines are handled for you. If
you pass a Voicemeeter version as an argument the wrapper will attempt to load
the program if it isn't currently running. Voicemeeter version may be one of:
- basic
- banana
- potato

If you wish to login/logout manually you may run them independently but you MUST
call login once at the start and once at the end of your program. Login can be
called with a keyword argument:
```ruby
require 'routines'
# Login with a keyword argument; logmein
vmr = Remote.new("banana", logmein: true)

# Set bus second from the left, mono ON, and then OFF
vmr.strip[2].mono = true
puts vmr.strip[2].mono
vmr.strip[2].mono = false
puts vmr.strip[2].mono

# Call logout once at the end of your program
vmr.logout
```
If you know for sure that Voicemeeter is already running you may omit the
Voicemeeter version when you call Remote, for example:
```ruby
require 'routines'
# no version passed as argument
vmr = Remote.new

vmr.run do
    vmr.strip[1].solo = true
end
```
In this case the wrapper will determine the version from the running instance
of Voicemeeter and build the strip layout accordingly.

All alias functions use a base 1 index meaning the strips and buses furthest to
the left are defined as strip[1], bus[1] and increment rightwards. If you prefer
to use a base 0 index you may pass a keyword argument base_0, for example:
```ruby
require 'routines'
vmr = Remote.new("potato", base_0: true)

vmr.run do
    # Set strip furthest to the left label name
    vmr.strip[0].label = 'my_strip_name'
    # Set bus furthest to the left mute ON, and then OFF
    vmr.bus[0].mute = true
    vmr.bus[0].mute = false

    # Set top left macrobutton state only ON
    vmr.button[0].stateonly = true
    # Set vban outstream strip nearest to the top ON
    vmr.vban_out[0].enable = true
end
```
As you see, the same applies to macrobutton and vban instream/outstream methods.

## Available commands
### Strip|Bus
Following commands work for both strips and buses
```ruby
# Set mono, solo, mute ON for strip 4
vmr.strip[4].mono = true
vmr.strip[4].mute = true
# Set gain to 3.6 for strip 2
vmr.strip[4].gain = 3.6
# Set mono, solo, mute OFF for bus 5
vmr.bus[5].mono = false
vmr.bus[5].mute = false
# Set gain to -2.0 for bus 5
vmr.bus[5].gain = -2.0
```
### Strip
Following commands work only for strips
```ruby
vmr.strip[4].solo = true
```
### Bus
Following commands work only for buses
```ruby
vmr.bus[1].EQ = true
```


### Macrobuttons
```ruby
# Set macrobutton 3 state (runs associated scripts) ON
vmr.button[3].state = true
vmr.button[3].state(1)
# Set macrobutton 4 stateonly (does not run associated scripts) ON
vmr.button[4].stateonly = true
vmr.button[4].stateonly(0)
# Set macrobutton 5 trigger OFF
vmr.button[5].trigger = false
vmr.button[5].trigger(0)
```

#### Run tests
For available tests use rake --tasks

Then:
```
Bundle exec rake basic:pass
```
to run tests for vb type basic test type pass
