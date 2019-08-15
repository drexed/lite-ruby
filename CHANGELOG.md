# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [1.0.11] - 2019-08-15
### Changed
- Renamed hash alias to aka

## [1.0.10] - 2019-08-15
### Changed
- Add modulize to camelize

## [1.0.9] - 2019-08-15
### Changed
- Remove unused local var from constantize

## [1.0.8] - 2019-08-15
### Changed
- Resolve constantize name clash

## [1.0.7] - 2019-08-15
### Changed
- Underscore initializer file name

## [1.0.6] - 2019-08-14
### Changed
- Add verbose option to Time elapse

## [1.0.5] - 2019-08-10
### Changed
- Improved speed for Array denillify
- Improved speed for Hash denillify

## [1.0.4] - 2019-08-10
### Added
- Added more boolean value checks
- Added Numeric => `markdown_percentage`
- Added Numeric => `markup_percentage`
- Added Object => `is_any?`
- Added Object => `to_bool`
- Added String => `dedupe`
### Changed
- Move Boolean classes to its own file

## [1.0.3] - 2019-07-30
### Added
- Added String => `non_possessive`
- Added String => `possessive`
- Added String => `possessive?`

## [1.0.2] - 2019-07-21
### Added
- Added Enumerable => `cluster_by`
- Added Enumerable => `frequency`
- Added Enumerable => `occur`
- Added Enumerable => `squeeze`
- Added Hash => `alias`
- Added Hash => `collate`
- Added Hash => `dearray_values`
- Added Hash => `dearray_singular_values`
- Added Hash => `delete_unless`
- Added Hash => `delete_values`
- Added Hash => `diff`
- Added Hash => `insert`
- Added Hash => `invert`
- Added Hash => `keys?`
- Added Hash => `only_keys?`
- Added Hash => `update_each`
- Added Hash => `update_keys`
- Added Hash => `update_values`
- Added Hash => `zip`
- Added Integer => `bit`
- Added Integer => `bit?`
- Added Integer => `bit_clear`
- Added Integer => `bitmask`
- Added Integer => `bitmask?`
- Added Numeric => `at_least?`
- Added Numeric => `at_most?`
- Added Numeric => `close?`
- Added Numeric => `delimit`
- Added Numeric => `delta`
- Added Numeric => `range`
- Added OpenStruct extensions
- Added String => `ascii_only`
- Added String => `capitalized?`
- Added String => `each_word`
- Added String => `encode_only`
- Added String => `lchomp`
- Added String => `methodize`
- Added String => `modulize`
- Added String => `pathize`
- Added String => `quote`
- Added String => `rotate`
- Added String => `unquote`
- Added String => `variablize`
- Added String => `words`
- Added String => `words_without_punctuation`
- Added Struct => `[]`
- Added Struct => `[]=`
### Changed
- Rename Time => `emperical => imperical`
- Rename Enumerable => `multiply => produce`
- Rename Enumerable => `divisible => quotient`

## [1.0.1] - 2019-07-12
### Added
- Added String => `acronym`
- Added Struct extensions
- Added Time => `elapse`
### Changed
- Configuration

## [1.0.0] - 2019-07-12
### Added
- Initial project version
