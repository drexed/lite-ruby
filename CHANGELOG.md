# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [1.1.7] - 2021-03-04
### Added
- Added Integer => `SQL_SMALLINT`
- Added Integer => `SQL_INTEGER`
- Added Integer => `SQL_BIGINT`

## [1.1.6] - 2021-02-17
### Added
- Added Time => `monotonic`
### Changed
- Time `elapse` to use monotonic time

## [1.1.5] - 2021-02-16
### Added
- Added Array => `divergence`

## [1.1.4] - 2020-11-19
### Changed
- Object `array?` coerce ARGV check from nil to string

## [1.1.3] - 2020-11-18
### Changed
- Object `array?` does not clash with PG gem

## [1.1.2] - 2020-11-08
### Changed
- Array `extract!` does not alias except
- Update string methods to mutate self

## [1.1.1] - 2020-11-08
### Changed
- Revert String => `transliterize` to `transliterate`

## [1.1.0] - 2020-11-06
### Added
- Added Array => `extract!` to `except!` alias
- Added Array => `only(!)` to `select_values(!)` alias
- Added Hash => `collect_keys` to `map_keys` alias
- Added Hash => `collect_values` to `map_values` alias
### Changed
- Rename Date, Time => `[method_name]_12` to `[method_name]12` ex: `hour_12` is now `hour12`
- Rename String => `transliterize` to `transliterate`
- Skip loading clashing methods with active support
### Remove
- Numeric `clamp`

## [1.0.31] - 2020-09-21
### Changed
- Changed `block_given?` => `defined?(yield)` for more performance

## [1.0.30] - 2020-07-03
### Added
- Added more Ruby 2.7 support

## [1.0.29] - 2020-07-03
### Added
- Added Ruby 2.7 support

## [1.0.28] - 2020-06-25
# Changed
- Rename String => `encode_only` to `safe_encode`
# Removed
- Remove String => `ascii_only`

## [1.0.26] - 2020-06-12
### Added
- Added Array => `all_after`
- Added Array => `all_before`

## [1.0.26] - 2020-05-22
### Changed
- Changed hash `to_open_struct` and `to_object` to be independent methods

## [1.0.25] - 2020-05-20
### Added
- Added Hash => `to_open_struct`
- Added Hash => `to_struct`
- Added OpenStruct => `to_hash`
- Added OpenStruct => `to_json(table: true)`

## [1.0.24] - 2020-05-07
### Added
- Added Object => `salvage_try`

## [1.0.23] - 2020-05-03
### Added
- Added Array => `except`
- Added Array => `only`

## [1.0.22] - 2020-04-11
### Fixed
- Fixed reverse_merge! on a frozen hash

## [1.0.21] - 2019-11-02
### Added
- Added Enumerable => `excluding`
- Added Enumerable => `including`
- Added Enumerable => `pluck`

## [1.0.20] - 2019-09-29
### Added
- Added Array => `rand_sample`

## [1.0.19] - 2019-09-03
### Added
- Added Array => `assert_min_values!`
- Added Array => `assert_all_min_values!`
- Added Hash => `assert_min_keys!`
- Added Hash => `assert_all_min_keys!`

## [1.0.18] - 2019-09-03
### Added
- Added Array => `assert_valid_values!`
- Added Array => `assert_all_valid_values!`
- Added Hash => `assert_pair_presence!`
- Added Hash => `assert_all_pair_presence!`
- Added Object => `presence`

## [1.0.17] - 2019-08-24
### Changed
- Improved how configuration works

## [1.0.16] - 2019-08-18
### Added
- Added Array => `deep_dup`
- Added Hash => `deep_dup`
- Added Integer => `combinatorial`
- Added Numeric => `round_down`
- Added Object => `deep_dup`
### Changed
- Changed how integer factorial works

## [1.0.15] - 2019-08-17
### Changed
- Added config check for each monkey patch

## [1.0.14] - 2019-08-17
### Changed
- Changed how hash deep_merge works

## [1.0.13] - 2019-08-16
### Changed
- Revert constantize function

## [1.0.12] - 2019-08-15
### Changed
- Changed how string underscore works
- Changed how string dasherize works

## [1.0.11] - 2019-08-15
### Changed
- Renamed hash alias to aka
- Changed how hash slice! works

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
