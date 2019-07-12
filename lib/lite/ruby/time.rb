# frozen_string_literal: true

class Time

  include Lite::Ruby::DateHelper
  include Lite::Ruby::TimeHelper

  def format(string = 'year-month-day hour:minute')
    delimiters = string.scan(/\W+/)
    formatters = string.scan(/[a-z0-9_]+/i)
    string = formatters.map { |key| "%#{format_for(key.to_sym)}#{delimiters.shift}" }
    strftime(string.join)
  end

  def stamp(key = :datetime_iso)
    key = stamp_for(key.to_sym)
    strftime(key)
  end

  alias to_format stamp

  private

  def format_for(key)
    TIME_UNITS[key] || DATE_UNITS[key]
  end

  def stamp_for(key)
    TIME_STAMPS[key] || DATE_STAMPS[key]
  end

end
