# frozen_string_literal: true

require 'date'

class Date

  include Lite::Ruby::DateHelper

  def format(string = 'year-month-day')
    delimiters = string.scan(/\W+/)
    formatters = string.scan(/[a-z0-9_]+/i)
    string = formatters.map { |key| "%#{format_for(key.to_sym)}#{delimiters.shift}" }
    strftime(string.join)
  end

  def stamp(key = :date_iso)
    key = stamp_for(key.to_sym)
    strftime(key)
  end

  alias to_format stamp

  private

  def format_for(key)
    DATE_UNITS[key]
  end

  def stamp_for(key)
    DATE_STAMPS[key]
  end

end
