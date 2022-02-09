# Time

`elapse`
------
Returns the amount of time taken to execute a block.

```ruby
Time.elapse { sleep 1 }                #=> 1.00005465
Time.elapse(verbose: true) { sleep 1 } #=> { started_at: 1565834550.444132, ended_at: 1565834551.447784, runtime: 1.0036518573760986 }
```

`format`
------
Converts a `time` object to `strftime` it using a human readable string.

**Note:** The following values are to be used in combination with one's available in
[Date](https://github.com/drexed/lite-ruby/blob/master/docs/DATE.md#format) `format`.

| Directive | Type | Key | `strftime` | Result |
| --- | --- | --- | --- | --- |
| Hour | 24h zero-padded | `h`, `hour`, `hour_padded` | %H | (00..23) |
| Hour | 24h blank-padded | `hh`, `HOUR`, `hour_blank` | %k | ( 0..23) |
| Hour | 12h zero-padded | `hhh`, `hour12`, `hour12_padded` | %I | (01..12) |
| Hour | 12h blank-padded | `hhhh`, `HOUR12`, `hour12_blank` | %l | ( 1..12) |
| Minute | Minute | `n`, `minute` | %M | (00..59) |
| Second | Second | `s`, `second` | %S | (00..59) |
| Meridian | Lowercase | `ampm`, `meridian` | %P | am..pm |
| Meridian | Uppercase | `AMPM`, `MERIDIAN` | %p | AM..PM |
| Time zone | Zone | `z`, `time_zone` | %z | +0900 |
| Time zone | Offset | `zz`, `time_zone_offset` | %:z | +09:00 |
| Time zone | Full-offset | `zzz`, `time_zone_offset_full` | %::z | +09:00:00 |
| Time zone | Name | `zzzz`, `time_zone_name` | %Z | UTC |

```ruby
Time.now.format('month_name day, year hour:minute ampm') #=> 'January 09, 2014 02:31 pm'
```

`monotonic`
------
Returns the monotonic time.

```ruby
Time.monotonic #=> 5834550.444132
```

`stamp` aka `to_format`
------
Converts a `time` object to a predefined format.

**Note:** The following values are to be used in combination with one's available in
[Date](https://github.com/drexed/lite-ruby/blob/master/docs/DATE.md#stamp-aka-to_format) `stamp`.

#### Base

| Directive | Type | Key | `strftime` | Result |
| --- | --- | --- | --- | --- |
| Hour | 24h zero-padded | `:hour`, `:hour_padded` | %H | (00..23) |
| Hour | 24h blank-padded | `:hour_blank` | %k | ( 0..23) |
| Hour | 12h zero-padded | `hour12`, `:hour12_padded` | %I | (01..12) |
| Hour | 12h blank-padded | `:hour12_blank` | %l | ( 1..12) |
| Minute | Minute | `:minute` | %M | (00..59) |
| Second | Second | `:second` | %S | (00..59) |
| Meridian | Lowercase | `:ampm` | %P | am..pm |
| Meridian | Uppercase | `:meridian` | %p | AM..PM |
| Time zone | Zone | `:time_zone` | %z | +0900 |
| Time zone | Offset | `:time_zone_offset` | %:z | +09:00 |
| Time zone | Full-offset | `:time_zone_offset_full` | %::z | +09:00:00 |
| Time zone | Name | `:time_zone_name` | %Z | UTC |

#### Combinations

| Directive | Type | Key | `strftime` | Result |
| --- | --- | --- | --- | --- |
| Combo | 24h time | `:time`, `:time_padded` | %H:%M | 00:31 |
| Combo | 24h time | `:time_blank` | %k:%M %z | 0:31 |
| Combo | 24h time | `:time_tz` | %H:%M %z | 00:31 +0000 |
| Combo | 24h time | `:time_tzn` | %H:%M %Z | 00:31 UTC |
| Combo | 12h time | `:time12`, `:time12_padded` | %I:%M %P | 07:31 am |
| Combo | 12h time | `:time12_blank` | %l:%M %P | 7:31 am |
| Combo | 12h Time | `:time12_tz` | %I:%M %P %z | 07:31 am +0000 |
| Combo | 12h Time | `:time12_tzn` | %I:%M %P %Z | 07:31 am UTC |
| Combo | 24h daytime | `:daytime` | %B %-d %H:%M | January 9 00:31 |
| Combo | 24h daytime | `:daytime_abbr` | %b %-d %H:%M | Jan 9 00:31 |
| Combo | 24h daytime | `:daytime_iso` | %m-%d %H:%M | 01-09 00:31 |
| Combo | 12h daytime | `:daytime12` | %B %-d %H:%M | January 9 12:31 am |
| Combo | 12h daytime | `:daytime12_abbr` | %b %-d %H:%M | Jan 9 12:31 am |
| Combo | 12h daytime | `:daytime12_iso` | %m-%d %H:%M | 01-09 12:31 am |
| Combo | 24h datetime | `:datetime` | %B %-d, %Y %H:%M | January 9, 2014 00:31 |
| Combo | 24h datetime | `:datetime_abbr` | %b %-d, %Y %H:%M | Jan 9, 2014 00:31 |
| Combo | 24h datetime | `:datetime_iso` | %Y-%m-%d %H:%M | 2014-01-09 00:31 |
| Combo | 24h datetime | `:datetime_tzn` | %B %-d, %Y %H:%M %Z | January 9, 2014 00:31 UTC |
| Combo | 24h datetime | `:datetime_abbr_tzn` | %b %-d, %Y %H:%M %Z | Jan 9, 2014 00:31 UTC |
| Combo | 24h datetime | `:datetime_iso_tzn` | %Y-%m-%d %H:%M %z | 2014-01-09 00:31 +0000 |
| Combo | 12h datetime | `:datetime12` | %B %-d, %Y %H:%M | January 9, 2014 12:31 am |
| Combo | 12h datetime | `:datetime12_abbr` | %b %-d, %Y %H:%M | Jan 9, 2014 12:31 am |
| Combo | 12h datetime | `:datetime12_iso` | %Y-%m-%d %H:%M | 2014-01-09 12:31 am |
| Combo | 12h datetime | `:datetime12_tzn` | %B %-d, %Y %H:%M %Z | January 9, 2014 12:31 am UTC |
| Combo | 12h datetime | `:datetime12_abbr_tzn` | %b %-d, %Y %H:%M %Z | Jan 9, 2014 12:31 am UTC |
| Combo | 12h datetime | `:datetime12_iso_tzn` | %Y-%m-%d %H:%M %z | 2014-01-09 12:31 am +0000 |
| Combo | Day 24h daytime | `:day_daytime` | %B %-d %H:%M | Sunday, January 9 00:31 |
| Combo | Day 24h daytime | `:day_daytime_abbr` | %b %-d %H:%M | Sun, Jan 9 00:31 |
| Combo | Day 24h daytime | `:day_daytime_iso` | %m-%d %H:%M | Sun, 01-09 00:31 |
| Combo | Day 12h daytime | `:day_daytime12` | %B %-d %H:%M | Sunday, January 9 12:31 am |
| Combo | Day 12h daytime | `:day_daytime12_abbr` | %b %-d %H:%M | Sun, Jan 9 12:31 am |
| Combo | Day 12h daytime | `:day_daytime12_iso` | %m-%d %H:%M | Sun, 01-09 12:31 am |
| Combo | Day 24h datetime | `:day_datetime` | %B %-d, %Y %H:%M | Sunday, January 9, 2014 00:31 |
| Combo | Day 24h datetime | `:day_datetime_abbr` | %b %-d, %Y %H:%M | Sun, Jan 9, 2014 00:31 |
| Combo | Day 24h datetime | `:day_datetime_iso` | %Y-%m-%d %H:%M | Sun, 2014-01-09 00:31 |
| Combo | Day 24h datetime | `:day_datetime_tzn` | %B %-d, %Y %H:%M %Z | Sunday, January 9, 2014 00:31 UTC |
| Combo | Day 24h datetime | `:day_datetime_abbr_tzn` | %b %-d, %Y %H:%M %Z | Sun, Jan 9, 2014 00:31 UTC |
| Combo | Day 24h datetime | `:day_datetime_iso_tzn` | %Y-%m-%d %H:%M %z | Sun, 2014-01-09 00:31 +0000 |
| Combo | Day 12h datetime | `:day_datetime12` | %B %-d, %Y %H:%M | Sunday, January 9, 2014 12:31 am |
| Combo | Day 12h datetime | `:day_datetime12_abbr` | %b %-d, %Y %H:%M | Sun, Jan 9, 2014 12:31 am |
| Combo | Day 12h datetime | `:day_datetime12_iso` | %Y-%m-%d %H:%M | Sun, 2014-01-09 12:31 am |
| Combo | Day 12h datetime | `:day_datetime12_tzn` | %B %-d, %Y %H:%M %Z | Sunday, January 9, 2014 12:31 am UTC |
| Combo | Day 12h datetime | `:day_datetime12_abbr_tzn` | %b %-d, %Y %H:%M %Z | Sun, Jan 9, 2014 12:31 am UTC |
| Combo | Day 12h datetime | `:day_datetime12_iso_tzn` | %Y-%m-%d %H:%M %z | Sun, 2014-01-09 12:31 am +0000 |

```ruby
Time.now.stamp(:datetime) #=> 'January 09, 2014 02:31 pm'
```
