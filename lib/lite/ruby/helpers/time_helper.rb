# frozen_string_literal: true

if Lite::Ruby.configuration.monkey_patches.include?('time')
  module Lite
    module Ruby
      module TimeHelper

        TIME_STAMPS = {
          hour: '%H',
          hour_blank: '%k',
          hour_padded: '%H',
          hour12: '%I',
          hour12_padded: '%I',
          hour12_blank: '%l',
          minute: '%M',
          second: '%S',
          ampm: '%P',
          meridian: '%p',
          time_zone: '%z',
          time_zone_offset: '%:z',
          time_zone_offset_full: '%::z',
          time_zone_name: '%Z',
          time: '%H:%M',
          time_blank: '%k:%M',
          time_padded: '%H:%M',
          time_tz: '%H:%M %z',
          time_tzn: '%H:%M %Z',
          time12: '%I:%M %P',
          time12_padded: '%I:%M %P',
          time12_blank: '%l:%M %P',
          time12_tz: '%I:%M %P %z',
          time12_tzn: '%I:%M %P %Z',
          daytime: '%B %-d %H:%M',
          daytime_abbr: '%b %-d %H:%M',
          daytime_iso: '%m-%d %H:%M',
          daytime12: '%B %-d %I:%M %P',
          daytime12_abbr: '%b %-d %I:%M %P',
          daytime12_iso: '%m-%d %I:%M %P',
          datetime: '%B %-d, %Y %H:%M',
          datetime_abbr: '%b %-d, %Y %H:%M',
          datetime_iso: '%Y-%m-%d %H:%M',
          datetime12: '%B %-d, %Y %I:%M %P',
          datetime12_abbr: '%b %-d, %Y %I:%M %P',
          datetime12_iso: '%Y-%m-%d %I:%M %P',
          datetime_tzn: '%B %-d, %Y %H:%M %Z',
          datetime_abbr_tzn: '%b %-d, %Y %H:%M %Z',
          datetime_iso_tzn: '%Y-%m-%d %H:%M %z',
          datetime12_tzn: '%B %-d, %Y %I:%M %P %Z',
          datetime12_abbr_tzn: '%b %-d, %Y %I:%M %P %Z',
          datetime12_iso_tzn: '%Y-%m-%d %I:%M %P %z'
        }.freeze
        TIME_UNITS = {
          h: 'H',
          hour: 'H',
          hour_padded: 'H',
          hh: 'k',
          HOUR: 'k',
          hour_blank: 'k',
          hhh: 'I',
          hour12: 'I',
          hour12_padded: 'I',
          hhhh: 'l',
          HOUR12: 'l',
          hour12_blank: 'l',
          n: 'M',
          minute: 'M',
          s: 'S',
          second: 'S',
          ampm: 'P',
          meridian: 'P',
          AMPM: 'p',
          MERIDIAN: 'p',
          z: 'z',
          time_zone: 'z',
          zz: ':z',
          time_zone_offset: ':z',
          zzz: '::z',
          time_zone_offset_full: '::z',
          zzzz: 'Z',
          time_zone_name: 'Z'
        }.freeze

      end
    end
  end
end
