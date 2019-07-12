# Date

`format`
------
Converts a `date` object to `strftime` it using a human readable string.

| Name | Type | Key | `strftime` | Result |
| --- | --- | --- | --- | --- |
| Month | digits zero-padded | `m`, `month`, `month_padded` | %m | (01..12) |
| Month | digits unpadded | `mm`, `Month`, `month_unpadded` | %-m | (1..12) |
| Month | digits blank-padded | `mmm`, `MONTH`, `day_blank` | %_m | ( 1..12) |
| Month | name | `mmmm`, `month_name` | %B | January |
| Month | name abbreviated | `mmmmm`, `month_name_abbr` | %b | Jan |
| Day | digits zero-padded | `d`, `day`, `day_padded` | %d | (01..31) |
| Day | digits unpadded | `dd`, `Day`, `day_unpadded` | %-d | (1..31) |
| Day | digits blank-padded | `ddd`, `DAY`, `day_blank` | %_d | ( 1..31) |
| Day | digits of the year | `dddd`, `day_of_the_year` | %j | (001..366) |
| Week | iso | `we`, `week` | %V | (00..53) |
| Week | starting sunday | `swe`, `sunday_week` | %U | (00..53) |
| Week | starting monday | `mwe`, `monday_week` | %W | (00..53) |
| Weekday | starting monday | `w`, `weekday` | %u | (1..7) |
| Weekday | starting sunday | `ww`, `weekday_offset` | %w | (0..6) |
| Weekday | name | `www`, `weekday_name` | %A | Sunday |
| Weekday | name abbreviated | `wwww`, `weekday_name_abbr` | %a | Sun |
| Year | digits two | `yy`, `yr` | %y | (00..99) |
| Year | digits four | `yyyy`, `year` | %Y | 1999 |

```ruby
Date.today.format('month_name day, year') #=> May 05, 2000
```
