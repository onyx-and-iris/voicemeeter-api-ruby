# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

Before any minor/major patch is released all test units will be run to verify they pass.

## [Unreleased]
- [ ] Add loading/saving of EQ profiles.
- [ ] Consider adding a multi_get function.

## [1.0.10] - 2021-05-12
### Added
- More settable commands for VBAN parameters

### Changed
- Update unit tests to reflect changes
- Updated README to reflect changes.
- define_types moved into utils.rb since it defines types for channels,
macrobuttons and vban
- number set int and real_number added to utils.rb to better define different
value types.

### Fixed
- Alias functions that accept boolean values now return true or false
- Bug in boundary test fixed by resetting match attributes m1,m2,m3 if no current match found

## [1.0.9] - 2021-04-30
### Added
- Support for other types of parameters in multi_set
- Automate running of every test for every version
- Settable delay before logout to avoid race condition on last command
- Delay for save/load special commands is now settable.
- Delay for shutdown special command is now settable.

### Changed
- Remote subclass moved into 'voicemeeter.rb'.
- All tests updated to reflect changes.
- Updated README to reflect changes.

## [1.0.8] - 2021-04-18
### Added
- Several attributes that define delays within the wrapper are now settable. This includes:
setdelay - A delay between each call to a setter
getdelay - A delay between each call to a getter
rundelay - A delay after the function runvb. (which starts Voicemeeter if a type is passed to Remote as an argument)
- Constants now define default values for delays:
ACCESSOR_DELAY = 0.001
RUNDELAY = 1

## [1.0.7] - 2021-04-18
### Added
- Added base0 test units for alias functions. This includes:
SetParamMultiBase0
MacroButtonStatusWithAliasBase0
SetParamMultiWithAliasBase0
-Added test/<vbtype>/minitest_helper_base0.rb to call multiple parameters with base0 index.
### Changed
-Test types multi, base0 can now be isolated. Params added to runmany to call these tests.

## [1.0.6] - 2021-04-18
### Added
- Base0 test units for each type.
- README updated to demonstrate set_multi, Macrobutton commands,
Special commands and a brief description on how to run tests.

### Changed
- Validate moved into Utils module. Since this no longer exclusively boundary tests params pertaining to strips/buses it seems appropriate to move this to a more generic module.

### Fixed
- Fixed an error in unit tests that prevented potato:macros from passing due
to loading different minitest_helpers from base0 tests. Test unit files that match
macrobutton_status*.rb are now isolated.
- Blueprint layout :composite and :patch_insert absolute values fixed.

## [1.0.5] - 2021-04-17
### Added
- VBAN commands:
vban - Turn vban on/off
vban.enable - Turn off an instream/oustream
- Output channels settable for recorder commands eg:
recorder.A1
recorder.B3

## [1.0.4] - 2021-04-17
### Added
- test/<vbtype>/errors/errors_minitest.rb test unit files added to test
custom error classes for each type of voicemeeter. Errors tests:
APIError
LoginError
LogoutError
VBTypeError
BoundsError
CommandError
ValueTypeError

### Changed
- Print outs for raised errors modified to include error.class as well
as the calling function. In the case of APIError the caller of the caller
is printed.

## [1.0.3] - 2021-04-16
### Added
- set_multi alias function for setting many parameters at once.
- test/other/set_multi.rb to demonstrate set_multi
- keyword arguments for setting various parameters on wrapper intialization

### Changed
- spec.metadata github source code url added to gemspec

## [1.0.1] - 2021-04-16
### Added
- gemspec
- release on rubygems
- Special commands:
command.shutdown - Close application
command.show - Bring Voicemeeter to foreground
command.restart - Restart audio engine
command.eject - Eject file form Recorder
command.reset - Reset prams to initial state
command.save - Save a config file in xml format
command.load - Load a config file in xml format
command.showvbanchat - Bring vban chatroom to foreground

- test/other/special.rb to demonstrate a special command

## [0.0.1] - 2021-04-16
### Added
- Initial Commit
- Core of API
- Test units
- README.md
