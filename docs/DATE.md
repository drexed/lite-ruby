# Date

`format`
------
Converts a `date` object to `strftime` it using a human readable string.

| Directive | Type | Key | `strftime` | Result |
| --- | --- | --- | --- | --- |
| Weekday | Monday | `w`, `weekday` | %u | (1..7) |
| Weekday | Sunday | `ww`, `weekday_offset` | %w | (0..6) |
| Weekday | Name | `www`, `weekday_name` | %A | Sunday |
| Weekday | Name abbr | `wwww`, `weekday_name_abbr` | %a | Sun |
| Day | Zero-padded | `d`, `day`, `day_padded` | %d | (01..31) |
| Day | Unpadded | `dd`, `Day`, `day_unpadded` | %-d | (1..31) |
| Day | Blank-padded | `ddd`, `DAY`, `day_blank` | %_d | ( 1..31) |
| Day | Day of the year | `dddd`, `day_of_the_year` | %j | (001..366) |
| Month | Zero-padded | `m`, `month`, `month_padded` | %m | (01..12) |
| Month | Unpadded | `mm`, `Month`, `month_unpadded` | %-m | (1..12) |
| Month | Blank-padded | `mmm`, `MONTH`, `day_blank` | %_m | ( 1..12) |
| Month | Name | `mmmm`, `month_name` | %B | January |
| Month | Name abbr | `mmmmm`, `month_name_abbr` | %b | Jan |
| Week | ISO | `we`, `week` | %V | (00..53) |
| Week | Monday | `mwe`, `monday_week` | %W | (00..53) |
| Week | Sunday | `swe`, `sunday_week` | %U | (00..53) |
| Year | 2 Digits | `yy`, `yr` | %y | (00..99) |
| Year | 4 Digits | `yyyy`, `year` | %Y | 1999 |

```ruby
Date.today.format('month_name day, year') #=> 'May 05, 2000'
```

`stamp` aka `to_format`
------
Converts a `date` object to a predefined format.

#### Base

| Directive | Type | Key | `strftime` | Result |
| --- | --- | --- | --- | --- |
| Weekday | Zero-padded | `:weekday`, `:weekday_padded` | %d | (01..31) |
| Weekday | Blank-padded | `:weekday_blank` | %_d | ( 1..31) |
| Weekday | Unpadded | `:weekday_unpadded` | %-d | (1..31) |
| Weekday | Name | `:weekday_name` | %A | Sunday |
| Weekday | Name abbr | `:weekday_name_abbr` | %a | Sun |
| Month | Zero-padded | `:month`, `:month_padded` | %m | (01..12) |
| Month | Unpadded | `:month_unpadded` | %-m | (1..12) |
| Month | Blank-padded | `:month_blank` | %_m | ( 1..12) |
| Month | Name | `:month_name` | %B | January |
| Month | Name abbr | `:month_name_abbr` | %b | Jan |
| Week | ISO | `:week_iso` | %V | (00..53) |
| Week | Sunday | `:week_sunday` | %U | (00..53) |
| Week | Monday | `:week_monday` | %W | (00..53) |
| Year | 2 Digits | `:yr`, `:year_abbr` | %y | (00..99) |
| Year | 4 Digits | `:year` | %Y | 1999 |

#### Combinations

| Directive | Type | Key | `strftime` | Result |
| --- | --- | --- | --- | --- |
| Combo | Month day | `:day` | %B %-d | January 9 |
| Combo | Month day | `:day_abbr` | %b %-d | Jan 9 |
| Combo | Month day | `:day_iso` | %m-%d | 01-09 |
| Combo | Month year | `:month_year`, `:month_padded_year` | %m %Y | (01..12) 2015 |
| Combo | Month year | `:month_blank_year` | %_m %Y | ( 1..12) 2015 |
| Combo | Month year | `:month_unpadded_year` | %-m %Y | (1..12) 2015 |
| Combo | Month year | `:month_name_year` | %B %Y | January 2015 |
| Combo | Month year | `:month_name_abbr_year` | %b %Y | Jan 2015 |
| Combo | Week year | `:week_year_iso` | %V-%G | 04-2014 |
| Combo | Year day | `:year_day` | %Y-%m-%d | 1999-01-21 |
| Combo | Year week | `:year_week` | %G-%V | 1999-52 |
| Combo | Year month | `:year_month` | %Y-%m | 1999-01 |
| Combo | Date | `:date` | %B %-d, %Y | January 9, 2014 |
| Combo | Date | `:date_abbr` | %b %-d, %Y | Jan 9, 2014 |
| Combo | Date | `:date_iso` | %Y-%m-%d | 2014-01-09 |

```ruby
Date.today.to_format(:year) #=> '2014'
```
