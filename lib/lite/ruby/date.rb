# frozen_string_literal: true

require 'date' unless defined?(Date)
require 'yaml' unless defined?(YAML)

require 'lite/ruby/helpers/date_time_helper' unless defined?(Lite::Ruby::DateTimeHelper)

class Date

  include Lite::Ruby::DateTimeHelper

  DEFAULT_STAMP = 'date_iso'
  DEFAULT_UNIT = 'year-month-day'

  STAMPS = YAML.load_file(
    File.expand_path('formats/date_stamps.yml', File.dirname(__FILE__))
  ).freeze
  UNITS = YAML.load_file(
    File.expand_path('formats/date_units.yml', File.dirname(__FILE__))
  ).freeze

end
