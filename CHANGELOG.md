# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

Before any major/minor/patch is released all test units will be run to verify they pass.

## [Unreleased] - These changes have not been added to RubyGems yet

-   [x] Add fetch level arrays for strips/buses
-   [ ] Add fadeto, fadeby methods for strips/buses
-   [x] Remove bounds checking for certain class properties.
-   [x] Move kinds, profiles into their own modules.
-   [x] Rework kind maps as structs
-   [x] Rework polling (speed up, add sync toggle)
-   [x] Renamed macrobutton getter/setter functions

## [2.0.4] - 2022-01-24

### Added

-   Ability to load config files in TOML format
-   Add option to pass keyword arguments to Remote class.
-   Voicemeeter.start added for starting voicemeeter independently of Remote class

### Changed

-   Use of VBVMR_RunVoicemeeter instead of open3 when starting voicemeeter.
-   Functions in low level modules set to private.
-   version 2.0.4 added to RubyGems.

### Fixed

-   Fix timing issue affecting macrobutton multi_set

## [2.0.3] - 2022-01-20

### Added

-   runmany.ps1 added. easy access to many test runs with logging and summary file.
-   link to official documentation in readme.
-   section regarding lower level functions, setters, getters and polling functions added to readme.

### Changed

-   Adjustment to polling function, now accepts getter logic as a block. Param caching
    now done in polling function
-   Small delay added to setters, except for set_parameter_multi function.
-   Added initialize to Remote class, building of class objects done now done in Remote.
-   version 2.0.3 added to RubyGems.

### Fixed

-   Fixed an issue with the action type property meta function in Command class.
-   Added ensure logout if block passed to run, will logout regardless of exception raised.

## [2.0.2] - 2022-01-18

### IMPORTANT

The code for this wrapper has been revised and reworked from the ground up. Earlier versions
are still available for download on RubyGems.org but that version will not be updated further.
Most of the updates documented here do not apply to version 2.0 onwards but will be kept for
reference use only.

All of the core features including strip, bus, macrobutton, recorder, vban and command classes
work exactly the same. An effort has been made to include every property previously available,
for each of those classes.

README is up to date with version 2.0.2 onwards.

### Added

-   Special command lock added
-   showvbanchat chat is now a boolean function.
-   Functions vmr.vban.enable and vmr.vban.disable for toggling VBAN now added.

### Changed

-   Each class for each of the core features has been put into its own module. Classes such as
    strip, bus and vban are now subclassed into physical/virtual and instream/outstream respectively.
-   Error classes have been simplified into a smaller number of classes.
-   remote class is now callable through Voicemeeter module. It is also now a factory function that
    returns a Remote class for the kind of Voicemeeter specified by the user.
-   Rake tests now simplified and reduced. They are now organised into higher and lower tests.

### Fixed

-   Writer validation logic has been moved into meta module. There is a base module for generic
    meta functions but where appropriate this is mixed in with a submodule.
-   set_multi function for setting many parameters at once now uses tokens for hash keys.
-   Polling dirty parameters works similarly but the cache is purged upon successful fetch.

---

## [1.0.10] - 2021-05-12

### Added

-   More settable commands for VBAN parameters

### Changed

-   Update unit tests to reflect changes
-   Updated README to reflect changes.
-   define_types moved into utils.rb since it defines types for channels,
    macrobuttons and vban
-   number set int and real_number added to utils.rb to better define different
    value types.

### Fixed

-   Alias functions that accept boolean values now return true or false
-   Bug in boundary test fixed by resetting match attributes m1,m2,m3 if no current match found

## [1.0.9] - 2021-04-30

### Added

-   Support for other types of parameters in multi_set
-   Automate running of every test for every version
-   Settable delay before logout to avoid race condition on last command
-   Delay for save/load special commands is now settable.
-   Delay for shutdown special command is now settable.

### Changed

-   Remote subclass moved into 'voicemeeter.rb'.
-   All tests updated to reflect changes.
-   Updated README to reflect changes.

## [1.0.8] - 2021-04-18

### Added

-   Several attributes that define delays within the wrapper are now settable. This includes:
    setdelay - A delay between each call to a setter
    getdelay - A delay between each call to a getter
    rundelay - A delay after the function runvb. (which starts Voicemeeter if a type is passed to Remote as an argument)
-   Constants now define default values for delays:
    ACCESSOR_DELAY = 0.001
    RUNDELAY = 1

## [1.0.7] - 2021-04-18

### Added

-   Added base0 test units for alias functions. This includes:
    SetParamMultiBase0
    MacroButtonStatusWithAliasBase0
    SetParamMultiWithAliasBase0
    -Added test/<vbtype>/minitest_helper_base0.rb to call multiple parameters with base0 index.

### Changed

-Test types multi, base0 can now be isolated. Params added to runmany to call these tests.

## [1.0.6] - 2021-04-18

### Added

-   Base0 test units for each type.
-   README updated to demonstrate set_multi, Macrobutton commands,
    Special commands and a brief description on how to run tests.

### Changed

-   Validate moved into Utils module. Since this no longer exclusively boundary tests params pertaining to strips/buses it seems appropriate to move this to a more generic module.

### Fixed

-   Fixed an error in unit tests that prevented potato:macros from passing due
    to loading different minitest_helpers from base0 tests. Test unit files that match
    macrobutton_status\*.rb are now isolated.
-   Blueprint layout :composite and :patch_insert absolute values fixed.

## [1.0.5] - 2021-04-17

### Added

-   VBAN commands:
    vban - Turn vban on/off
    vban.enable - Turn off an instream/oustream
-   Output channels settable for recorder commands eg:
    recorder.A1
    recorder.B3

## [1.0.4] - 2021-04-17

### Added

-   test/<vbtype>/errors/errors_minitest.rb test unit files added to test
    custom error classes for each type of voicemeeter. Errors tests:
    APIError
    LoginError
    LogoutError
    VBTypeError
    BoundsError
    CommandError
    ValueTypeError

### Changed

-   Print outs for raised errors modified to include error.class as well
    as the calling function. In the case of APIError the caller of the caller
    is printed.

## [1.0.3] - 2021-04-16

### Added

-   set_multi alias function for setting many parameters at once.
-   test/other/set_multi.rb to demonstrate set_multi
-   keyword arguments for setting various parameters on wrapper intialization

### Changed

-   spec.metadata github source code url added to gemspec

## [1.0.1] - 2021-04-16

### Added

-   gemspec
-   release on rubygems
-   Special commands:
    command.shutdown - Close application
    command.show - Bring Voicemeeter to foreground
    command.restart - Restart audio engine
    command.eject - Eject file form Recorder
    command.reset - Reset prams to initial state
    command.save - Save a config file in xml format
    command.load - Load a config file in xml format
    command.showvbanchat - Bring vban chatroom to foreground

-   test/other/special.rb to demonstrate a special command

## [0.0.1] - 2021-04-16

### Added

-   Initial Commit
-   Core of API
-   Test units
-   README.md
