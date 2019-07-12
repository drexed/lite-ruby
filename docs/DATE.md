# Date

**Note:** The following `format` and `stamp` values can also be used with `time` objects.

`format`
------
Converts a `date` object to `strftime` it using a human readable string.

| Name | Type | Key | `strftime` | Result |
| --- | --- | --- | --- | --- |
| Month | Digits zero-padded | `m`, `month`, `month_padded` | %m | (01..12) |
| Month | Digits unpadded | `mm`, `Month`, `month_unpadded` | %-m | (1..12) |
| Month | Digits blank-padded | `mmm`, `MONTH`, `day_blank` | %_m | ( 1..12) |
| Month | Name | `mmmm`, `month_name` | %B | January |
| Month | Name abbreviated | `mmmmm`, `month_name_abbr` | %b | Jan |
| Day | Digits zero-padded | `d`, `day`, `day_padded` | %d | (01..31) |
| Day | Digits unpadded | `dd`, `Day`, `day_unpadded` | %-d | (1..31) |
| Day | Digits blank-padded | `ddd`, `DAY`, `day_blank` | %_d | ( 1..31) |
| Day | Digits of the year | `dddd`, `day_of_the_year` | %j | (001..366) |
| Week | ISO | `we`, `week` | %V | (00..53) |
| Week | Starting sunday | `swe`, `sunday_week` | %U | (00..53) |
| Week | Starting monday | `mwe`, `monday_week` | %W | (00..53) |
| Weekday | Starting monday | `w`, `weekday` | %u | (1..7) |
| Weekday | Starting sunday | `ww`, `weekday_offset` | %w | (0..6) |
| Weekday | Name | `www`, `weekday_name` | %A | Sunday |
| Weekday | Name abbreviated | `wwww`, `weekday_name_abbr` | %a | Sun |
| Year | Digits two | `yy`, `yr` | %y | (00..99) |
| Year | Digits four | `yyyy`, `year` | %Y | 1999 |

```ruby
Date.today.format('month_name day, year') #=> May 05, 2000
```

`stamp` aka `to_format`
------
Converts a `date` object to a predefined format.

| Name | Type | Key | `strftime` | Result |
| --- | --- | --- | --- | --- |
| Month | digits zero-padded | `:month`, `:month_padded` | %m | (01..12) |
| Month | digits unpadded | `:month_unpadded` | %-m | (1..12) |
| Month | digits blank-padded | `:month_blank` | %_m | ( 1..12) |
| Month | name | `:month_name` | %B | January |
| Month | name abbreviated | `:month_name_abbr` | %b | Jan |
| Month | digits zero-padded | `:month_year`, `:month_padded_year` | %m %Y | (01..12) 2015 |
| Month | digits unpadded | `:month_unpadded_year` | %-m %Y | (1..12) 2015 |
| Month | digits blank-padded | `:month_blank_year` | %_m %Y | ( 1..12) 2015 |
| Month | name | `:month_name_year` | %B %Y | January 2015 |
| Month | name abbreviated | `:month_name_abbr_year` | %b %Y | Jan 2015 |
| Week | iso | `:week_iso` | %V | (00..53) |
| Week | sunday week | `:sunday_week` | %U | (00..53) |
| Week | monday week | `:monday_week` | %W | (00..53) |
| Week | week year iso | `:week_year_iso` | %V-%G | 04-2014 |
| Weekday | digits zero-padded | `:weekday_padded` | %d | (01..31) |
| Weekday | digits unpadded | `:weekday_unpadded` | %-d | (1..31) |
| Weekday | digits blank-padded | `:weekday_blank` | %_d | ( 1..31) |
| Weekday | name | `:weekday_name` | %A | Sunday |
| Weekday | name abbreviated | `:weekday_name_abbr` | %a | Sun |
| Year | digits two | `:yr` | %y | (00..99) |
| Year | digits four | `:year` | %Y | 1999 |
| Year | day | `:year_day` | %Y-%m-%d | 1999-01-21 |
| Year | week | `:year_week` | %G-%V | 1999-52 |
| Year | month | `:year_month` | %Y-%m | 1999-01 |
| Date | name | `:date` | %B %-d, %Y | January 9, 2014 |
| Date | name abbreviated | `:date_abbr` | %b %-d, %Y | Jan 9, 2014 |
| Date | iso | `:date_iso` | %Y-%m-%d | 2014-01-09 |
| Day | name | `:day` | %B %-d | January 9 |
| Day | name abbreviated | `:day_abbr` | %b %-d | Jan 9 |
| Day | iso | `:day_iso` | %m-%d | 01-09 |

```ruby
Date.today.to_format(:year) #=> '2014'
```
