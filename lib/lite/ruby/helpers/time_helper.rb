# frozen_string_literal: true

module Lite
  module Ruby
    module TimeHelper

      TIME_STAMPS ||= {
        hour: '%H',
        hour_padded: '%H',
        hour_blank: '%k',
        hour_emperical: '%I',
        hour_emperical_padded: '%I',
        hour_emperical_blank: '%l',
        minute: '%M',
        second: '%S',
        ampm: '%P',
        meridian: '%P',
        time: '%H:%M',
        time_blank: '%k:%M',
        time_padded: '%H:%M',
        time_zone: '%z',
        time_zone_offset: '%:z',
        time_zone_offset_full: '%::z',
        time_zone_name: '%Z',
        time_tz: '%H:%M %z',
        time_tzn: '%H:%M %Z',
        time_emperical: '%I:%M %P',
        time_emperical_padded: '%I:%M %P',
        time_emperical_blank: '%l:%M %P',
        time_emperical_tz: '%I:%M %P %z',
        time_emperical_tzn: '%I:%M %P %Z',
        daytime: '%B %-d %H:%M',
        daytime_abbr: '%b %-d %H:%M',
        daytime_iso: '%m-%d %H:%M',
        daytime_emperical: '%B %-d %I:%M %P',
        daytime_emperical_abbr: '%b %-d %I:%M %P',
        daytime_emperical_iso: '%m-%d %I:%M %P',
        datetime: '%B %-d, %Y %H:%M',
        datetime_abbr: '%b %-d, %Y %H:%M',
        datetime_iso: '%Y-%m-%d %H:%M',
        datetime_emperical: '%B %-d, %Y %I:%M %P',
        datetime_emperical_abbr: '%b %-d, %Y %I:%M %P',
        datetime_emperical_iso: '%Y-%m-%d %I:%M %P',
        datetime_tzn: '%B %-d, %Y %H:%M %Z',
        datetime_abbr_tzn: '%b %-d, %Y %H:%M %Z',
        datetime_iso_tzn: '%Y-%m-%d %H:%M %z',
        datetime_emperical_tzn: '%B %-d, %Y %I:%M %P %Z',
        datetime_emperical_abbr_tzn: '%b %-d, %Y %I:%M %P %Z',
        datetime_emperical_iso_tzn: '%Y-%m-%d %I:%M %P %z'
      }.freeze
      TIME_UNITS = {
        h: 'H',
        hour: 'H',
        hour_padded: 'H',
        hh: 'k',
        HOUR: 'k',
        hour_blank: 'k',
        hhh: 'I',
        hour_emperical: 'I',
        hour_emperical_padded: 'I',
        hhhh: 'l',
        HOUR_IMPERICAL: 'l',
        hour_emperical_blank: 'l',
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
