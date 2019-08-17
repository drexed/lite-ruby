# frozen_string_literal: true

if Lite::Ruby.configuration.monkey_patches.include?('date')
  module Lite
    module Ruby
      module DateHelper

        DATE_STAMPS ||= {
          weekday: '%d',
          weekday_blank: '%_d',
          weekday_padded: '%d',
          weekday_unpadded: '%-d',
          weekday_name: '%A',
          weekday_name_abbr: '%a',
          month: '%m',
          month_blank: '%_m',
          month_padded: '%m',
          month_unpadded: '%-m',
          month_name: '%B',
          month_name_abbr: '%b',
          week_iso: '%V',
          week_monday: '%W',
          week_sunday: '%U',
          year: '%Y',
          yr: '%y',
          year_abbr: '%y',
          day: '%B %-d',
          day_abbr: '%b %-d',
          day_iso: '%m-%d',
          month_year: '%m %Y',
          month_blank_year: '%_m %Y',
          month_padded_year: '%m %Y',
          month_unpadded_year: '%-m %Y',
          month_name_year: '%B %Y',
          month_name_abbr_year: '%b %Y',
          week_year_iso: '%V-%G',
          year_day: '%Y-%m-%d',
          year_month: '%Y-%m',
          year_week: '%G-%V',
          date: '%B %-d, %Y',
          date_abbr: '%b %-d, %Y',
          date_iso: '%Y-%m-%d'
        }.freeze
        DATE_UNITS ||= {
          w: 'u',
          weekday: 'u',
          ww: 'w',
          weekday_offset: 'w',
          www: 'A',
          weekday_name: 'A',
          wwww: 'a',
          weekday_name_abbr: 'a',
          d: 'd',
          day: 'd',
          day_padded: 'd',
          dd: '-d',
          Day: '-d',
          day_unpadded: '-d',
          ddd: '_d',
          DAY: '_d',
          day_blank: '_d',
          dddd: 'j',
          day_of_the_year: 'j',
          m: 'm',
          month: 'm',
          month_padded: 'm',
          mm: '-m',
          Month: '-m',
          month_unpadded: '-m',
          mmm: '_m',
          MONTH: '_m',
          month_blank: '_m',
          mmmm: 'B',
          month_name: 'B',
          mmmmm: 'b',
          month_name_abbr: 'b',
          swe: 'U',
          sunday_week: 'U',
          mwe: 'W',
          monday_week: 'W',
          we: 'V',
          week: 'V',
          yy: 'y',
          yr: 'y',
          year: 'Y',
          yyyy: 'Y'
        }.freeze

        def format(string = nil)
          string ||= default_format
          delimiters = string.scan(/\W+/)
          formatters = string.scan(/[a-z0-9_]+/i)
          string = formatters.map { |key| "%#{format_for(key.to_sym)}#{delimiters.shift}" }
          strftime(string.join)
        end

        def stamp(key = nil)
          key = stamp_for(key&.to_sym || default_stamp)
          strftime(key)
        end

        alias to_format stamp

      end
    end
  end
end
