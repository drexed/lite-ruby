# Time

`format`
------
Converts a `time` object to `strftime` it using a human readable string.

**Note:** The following values are to be used in combination with one's available in
[Date](https://github.com/drexed/lite-ruby/blob/master/docs/DATE.md#format).

| Name | Type | Key | `strftime` | Result |
| --- | --- | --- | --- | --- |
| Hour | 12h zero-padded | `hhh`, `hour_emperical`, `hour_emperical_padded` | %I | (01..12) |
| Hour | 12h blank-padded | `hhhh`, `HOUR_EMPERICAL`, `hour_emperical_blank` | %l | ( 1..12) |
| Hour | 24h zero-padded | `h`, `hour`, `hour_padded` | %H | (00..23) |
| Hour | 24h blank-padded | `hh`, `HOUR`, `hour_blank` | %k | ( 0..23) |
| Minute | Minute | `n`, `minute` | %M | (00..59) |
| Second | Second | `s`, `second` | %S | (00..59) |
| Meridian | Lowercase | `ampm`, `meridian` | %p | am..pm |
| Meridian | Uppercase | `AMPM`, `MERIDIAN` | %P | AM..PM |
| Time zone | Zone | `z`, `time_zone` | %z | +0900 |
| Time zone | Offset | `zz`, `time_zone_offset` | %:z | +09:00 |
| Time zone | Full-offset | `zzz`, `time_zone_offset_full` | %::z | +09:00:00 |
| Time zone | Name | `zzzz`, `time_zone_name` | %Z | UTC |

```ruby
Time.now.format('month_name day, year hour:minute ampm') #=> 'January 09, 2014 02:31 pm'
```

`stamp` aka `to_format`
------
Converts a `time` object to a predefined format.

**Note:** The following values are to be used in combination with one's available in
[Date](https://github.com/drexed/lite-ruby/blob/master/docs/DATE.md#stamp-aka-to_format).

| Name | Type | Key | `strftime` | Result |
| --- | --- | --- | --- | --- |
| Hour | zero-padded | `:hour`, `:hour_padded` | %H | (00..23) |
| Hour | blank-padded | `:hour_blank` | %k | ( 0..23) |
| Hour | zero-padded emperical | `:hour_emperical_padded` | %I | (01..12) |
| Hour | blank-padded emperical | `:hour_emperical_blank` | %l | ( 1..12) |
| Minute | minute | `:minute` | %M | (00..59) |
| Second | second | `:second` | %S | (00..60) |
| Time Zone | time zone | `:time_zone` | %z | +0900 |
| Time Zone | hour and minute offset | `:time_zone_offset` | %:z | +09:00 |
| Time Zone | hour, minute and second offset | `:time_zone_offset_full` | %::z | +09:00:00 |
| Time Zone | time zone name | `:time_zone_name` | %Z | UTC |
| Datetime | name | `:datetime` | %B %-d, %Y %H:%M | January 9, 2014 00:31 |
| Datetime | name abbreviated | `:datetime_abbr` | %b %-d, %Y %H:%M | Jan 9, 2014 00:31 |
| Datetime | iso | `:datetime_iso` | %Y-%m-%d %H:%M | 2014-01-09 00:31 |
| Datetime | name emperical | `:datetime_emperical` | %B %-d, %Y %H:%M | January 9, 2014 12:31 am |
| Datetime | name abbreviated emperical | `:datetime_emperical_abbr` | %b %-d, %Y %H:%M | Jan 9, 2014 12:31 am |
| Datetime | iso emperical | `:datetime_emperical_iso` | %Y-%m-%d %H:%M | 2014-01-09 12:31 am |
| Datetime | name time zone | `:datetime_tzn` | %B %-d, %Y %H:%M %Z | January 9, 2014 00:31 UTC |
| Datetime | name abbreviated time zone | `:datetime_abbr_tzn` | %b %-d, %Y %H:%M %Z | Jan 9, 2014 00:31 UTC |
| Datetime | iso time zone | `:datetime_iso_tzn` | %Y-%m-%d %H:%M %z | 2014-01-09 00:31 +0000 |
| Datetime | name emperical time zone | `:datetime_emperical_tzn` | %B %-d, %Y %H:%M %Z | January 9, 2014 12:31 am UTC |
| Datetime | name abbreviated emperical time zone | `:datetime_emperical_abbr_tzn` | %b %-d, %Y %H:%M %Z | Jan 9, 2014 12:31 am UTC |
| Datetime | iso emperical time zone | `:datetime_emperical_iso_tzn` | %Y-%m-%d %H:%M %z | 2014-01-09 12:31 am +0000 |
| Daytime | name | `:daytime` | %B %-d %H:%M | January 9 00:31 |
| Daytime | name abbreviated | `:daytime_abbr` | %b %-d %H:%M | Jan 9 00:31 |
| Daytime | iso | `:daytime_iso` | %m-%d %H:%M | 01-09 00:31 |
| Daytime | name emperical | `:daytime_emperical` | %B %-d %H:%M | January 9 12:31 am |
| Daytime | name abbreviated emperical | `:daytime_emperical_abbr` | %b %-d %H:%M | Jan 9 12:31 am |
| Daytime | iso emperical | `:daytime_emperical_iso` | %m-%d %H:%M | 01-09 12:31 am |
| Time | zero-padded | `:time`, `:time_padded` | %H:%M | 00:31 |
| Time | blank-padded | `:time_blank` | %k:%M %z | 0:31 |
| Time | zero-padded emperical | `:time_emperical`, `:time_emperical_padded` | %I:%M %P | 07:31 |
| Time | blank-padded emperical | `:time_emperical_blank` | %l:%M %P | 7:31 |
| Time | with time zone | `:time_tz` | %H:%M %z | 00:31 +0000 |
| Time | with time zone name | `:time_tzn` | %H:%M %Z | 00:31 UTC |

```ruby
Time.now.stamp(:datetime) #=> 'January 09, 2014 02:31 pm'
```
