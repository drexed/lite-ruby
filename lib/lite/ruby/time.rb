# frozen_string_literal: true

class Time

  include Lite::Ruby::DateHelper
  include Lite::Ruby::TimeHelper

  def self.elapse
    time = now.to_f
    yield
    now.to_f - time
  end

  private

  def default_format
    'year-month-day hour:minute'
  end

  def default_stamp
    :datetime_iso
  end

  def format_for(key)
    TIME_UNITS[key] || DATE_UNITS[key]
  end

  def stamp_for(key)
    TIME_STAMPS[key] || DATE_STAMPS[key]
  end

end
