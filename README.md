# Lite::Ruby

[![Gem Version](https://badge.fury.io/rb/lite-ruby.svg)](http://badge.fury.io/rb/lite-ruby)
[![Build Status](https://travis-ci.org/drexed/lite-ruby.svg?branch=master)](https://travis-ci.org/drexed/lite-ruby)

Lite::Ruby is a collection of useful Ruby methods for its primitive classes.
AcitveSupport equivalent methods do not get included when AcitveSupport is available.

**NOTE:** If you are coming from `ActiveObject`, please read the [port](#port) section.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'lite-ruby'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install lite-ruby

## Table of Contents

* [Configurations](#configurations)
* [Extensions](#extensions)
* [3rd-party](#3rd-party)
* [Port](#port)

## Configurations

`rails g lite:ruby:install` will generate the following file:
`../config/initalizers/lite_ruby.rb`

```ruby
Lite::Ruby.configure do |config|
  config.monkey_patches = %w[
    array boolean date enumerable hash integer kernel numeric object open_struct range string
    struct time
  ]
end
```

## Extensions

* [Array](https://github.com/drexed/lite-ruby/blob/master/docs/ARRAY.md)
* [Boolean](https://github.com/drexed/lite-ruby/blob/master/docs/BOOLEAN.md)
* [Date](https://github.com/drexed/lite-ruby/blob/master/docs/DATE.md)
* [Enumerable](https://github.com/drexed/lite-ruby/blob/master/docs/ENUMERABLE.md)
* [Hash](https://github.com/drexed/lite-ruby/blob/master/docs/HASH.md)
* [Integer](https://github.com/drexed/lite-ruby/blob/master/docs/INTEGER.md)
* [Kernel](https://github.com/drexed/lite-ruby/blob/master/docs/KERNEL.md)
* [Numeric](https://github.com/drexed/lite-ruby/blob/master/docs/NUMERIC.md)
* [Object](https://github.com/drexed/lite-ruby/blob/master/docs/OBJECT.md)
* [Open Struct](https://github.com/drexed/lite-ruby/blob/master/docs/OPEN_STRUCT.md)
* [Range](https://github.com/drexed/lite-ruby/blob/master/docs/RANGE.md)
* [String](https://github.com/drexed/lite-ruby/blob/master/docs/STRING.md)
* [Struct](https://github.com/drexed/lite-ruby/blob/master/docs/STRUCT.md)
* [Time](https://github.com/drexed/lite-ruby/blob/master/docs/TIME.md)

## 3rd-party

The following are highly recommended 3rd-party extensions to supplement your workflow:

* **Performance:** Escape Utils - https://github.com/brianmario/escape_utils
* **Performance:** Fast Blank - https://github.com/SamSaffron/fast_blank
* **Extensions:** Facets - https://github.com/rubyworks/facets
* **Extensions:** Finishing Moves - https://github.com/forgecrafted/finishing_moves

## Port

`Lite::Ruby` is a compatible port of [ActiveObject](https://github.com/drexed/active_object).

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/lite-ruby. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Lite::Ruby project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/lite-ruby/blob/master/CODE_OF_CONDUCT.md).
