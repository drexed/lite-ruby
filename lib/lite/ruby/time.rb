# frozen_string_literal: true

require 'yaml' unless defined?(YAML)

require 'lite/ruby/helpers/date_time_helper' unless defined?(Lite::Ruby::DateTimeHelper)

class Time

  include Lite::Ruby::DateTimeHelper

  DEFAULT_STAMP = 'datetime_iso'
  DEFAULT_UNIT = 'year-month-day hour:minute'

  STAMPS =
    YAML.load_file(File.expand_path('formats/time_stamps.yml', File.dirname(__FILE__))).merge(
      YAML.load_file(File.expand_path('formats/date_stamps.yml', File.dirname(__FILE__)))
    ).freeze
  UNITS =
    YAML.load_file(File.expand_path('formats/time_units.yml', File.dirname(__FILE__))).merge(
      YAML.load_file(File.expand_path('formats/date_units.yml', File.dirname(__FILE__)))
    ).freeze

  class << self

    def elapse(verbose: false)
      started_at = monotonic
      yield
      ended_at = monotonic
      runtime = ended_at - started_at
      return runtime unless verbose

      { started_at: started_at, ended_at: ended_at, runtime: runtime }
    end

    def monotonic
      Process.clock_gettime(Process::CLOCK_MONOTONIC)
    end

  end

end
