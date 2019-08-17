# frozen_string_literal: true

if Lite::Ruby.configuration.monkey_patches.include?('date')
  require 'date'

  class Date

    include Lite::Ruby::DateHelper

    private

    def default_format
      'year-month-day'
    end

    def default_stamp
      :date_iso
    end

    def format_for(key)
      DATE_UNITS[key]
    end

    def stamp_for(key)
      DATE_STAMPS[key]
    end

  end
end
