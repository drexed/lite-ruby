## Numeric

**Add:**
`add` returns the sum of two numbers.

```ruby
4.add(2) #=> 6
```

**Bytes in Bytes:**
`byte_in_bytes` and `bytes_in_bytes` returns self.

```ruby
3.bytes_in_bytes #=> 3
```

**Centigrams in Grams:**
`centigram_in_grams` and `centigrams_in_grams` returns the amount of grams in n centigrams.

```ruby
3.centigrams_in_grams #=> 0.03
```

**Centimeters in Meters:**
`centimeter_in_meters` and `centimeters_in_meters` returns the amount of meters in n centimeters.

```ruby
3.centimeters_in_meters #=> 0.03
```

**Centuries_in_seconds:**
`century_in_seconds` and `centuries_in_seconds` returns the amount of seconds in n centuries.

```ruby
3.centuries_in_seconds #=> 9467280000.0
```

**Clamp:**
`clamp` returns a comparable between a lower and upper bound.

```ruby
1.clamp(3, 6) # => 3
5.clamp(3..6) # => 5
8.clamp(3, 6) # => 6
```

**Days in Seconds:**
`day_in_seconds` and `days_in_seconds` returns the amount of seconds in n days.

```ruby
3.days_in_seconds #=> 259200
```

**Decades in Seconds:**
`decade_in_seconds` and `decades_in_seconds` returns the amount of seconds in n decades.

```ruby
3.decades_in_seconds #=> 946728000.0
```
**Decagrams in Grams:**
`decagram_in_grams` and `decagrams_in_grams` returns the amount of grams in n decagrams.

```ruby
3.decagrams_in_grams #=> 30
```

**Decameters in Meters:**
`decameter_in_meters` and `decameters_in_meters` returns the amount of meters in n decameters.

```ruby
3.decameters_in_meters #=> 30
```

**Decigrams in Grams:**
`decigram_in_grams` and `decigrams_in_grams` returns the amount of grams in n decigrams.

```ruby
3.decigrams_in_grams #=> 0.3
```

**Decimeters in Meters:**
`decimeter_in_meters` and `decimeters_in_meters` returns the amount of meters in n decimeters.

```ruby
3.decimeters_in_meters #=> 0.3
```

**degrees_to_radians:**
`degrees_to_radians` returns number of degrees into radians.

```ruby
90.degrees_to_radians #=> 1.5707963267948966
```

**Distance:**
`distance` returns the absolute difference between numbers.

```ruby
5.distance(3) #=> 2
3.distance(5) #=> 2
```

**Divide:**
`divide` returns the division of two numbers.

```ruby
4.divide(2) #=> 2
0.divide(2) #=> 0
4.divide(0) #=> 0
```

**Exabytes in Bytes:**
`exabyte_in_bytes` and `exabytes_in_bytes` returns the amount of bytes in n exabytes.

```ruby
3.exabytes_in_bytes #=> 3458764513820540928
```

**Feet in Inches:**
`foot_in_inches` and `feet_in_inches` returns the amount of inches in n feet.

```ruby
3.feet_in_inches #=> 36
```

**Fractional:**
`fractional` returns the numbers after '.' of a float.

```ruby
1.0.fraction      #=> 0.0
12.2456.fraction  #=> 0.2456
-12.2456.fraction #=> 0.2456
```

**Fraction?:**
`fraction?` returns if its a fractional.

```ruby
1.0.fraction?      #=> false
12.2456.fraction?  #=> true
```

**Gigabytes in Bytes:**
`gigabyte_in_bytes` and `gigabytes_in_bytes` returns the amount of bytes in n gigabytes.

```ruby
3.gigabytes_in_bytes #=> 3221225472
```

**Grams in Grams:**
`gram_in_grams` and `grams_in_grams` returns self.

```ruby
3.grams_in_grams #=> 3
```

**Greater Than:**
`greater_than?` returns true if self is greater than n.

```ruby
3.greater_than?(2) #=> true
3.greater_than?(3) #=> false
3.greater_than?(4) #=> false
```

**Greater Than or Equal To:**
`greater_than_or_equal_to?` returns true if self is greater than or equal to n.

```ruby
3.greater_than_or_equal_to?(2) #=> true
3.greater_than_or_equal_to?(3) #=> true
3.greater_than_or_equal_to?(4) #=> false
```

**Hectograms in Grams:**
`hectogram_in_grams` and `hectograms_in_grams` returns the amount of grams in n hectograms.

```ruby
3.hectograms_in_grams #=> 300
```

**Hectometers in Meters:**
`hectometer_in_meters` and `hectometers_in_meters` returns the amount of meters in n hectometers.

```ruby
3.hectometers_in_meters #=> 300
```

**Hours in Seconds:**
`hour_in_seconds` and `hours_in_seconds` returns the amount of seconds in n hours.

```ruby
3.hours_in_seconds #=> 10800
```

**Inches in Inches:**
`inch_in_inches` and `inches_in_inches` returns the amount of inches in n inches.

```ruby
3.inches_in_inches #=> 3
```

**Inside:**
`inside?` returns true if n is greater than start and less than finish. Similar to between but does not return true if equal to self.

```ruby
3.inside?(1, 5) #=> true
3.inside?(3, 5) #=> false
```

**Kilobytes in Bytes:**
`kilobyte_in_bytes` and `kilobytes_in_bytes` returns the amount of bytes in n kilobytes.

```ruby
3.kilobytes_in_bytes #=> 3072
```

**Kilograms in Grams:**
`kilogram_in_grams` and `kilograms_in_grams` returns the amount of grams in n kilograms.

```ruby
3.kilograms_in_grams #=> 3000
```

**Kilometers in Meters:**
`kilometer_in_meters` and `kilometers_in_meters` returns the amount of meters in n kilometers.

```ruby
3.kilometers_in_meters #=> 3000
```

**Less Than:**
`less_than?` returns true if self is less than n.

```ruby
3.less_than?(2) #=> false
3.less_than?(3) #=> false
3.less_than?(4) #=> true
```

**Less Than or Equal To:**
`less_than_or_equal_to?` returns true if self is less than or equal to n.

```ruby
3.less_than_or_equal_to?(2) #=> false
3.less_than_or_equal_to?(3) #=> true
3.less_than_or_equal_to?(4) #=> true
```

**Metric Ton in Ounces:**
`metric_ton_in_ounces` and `metric_tons_in_ounces` returns the amount of grams in n metric_tons.

```ruby
3.metric_tons_in_ounces #=> 3000000
```

**Megabytes in Bytes:**
`megabyte_in_bytes` and `megabytes_in_bytes` returns the amount of bytes in n megabytes.

```ruby
3.megabytes_in_bytes #=> 3145728
```

**Meters in Meters:**
`meter_in_meters` and `meters_in_meters` returns self.

```ruby
3.meters_in_meters #=> 3
```

**Miles in Inches:**
`mile_in_inches` and `miles_in_inches` returns the amount of inches in n miles.

```ruby
3.miles_in_inches #=> 190080
```

**Millenniums in Seconds:**
`millennium_in_seconds` and `millenniums_in_seconds` returns the amount of seconds in n millenniums.

```ruby
3.millenniums_in_seconds #=> 94672800000.0
```

**Milligrams in Grams:**
`milligram_in_grams` and `milligrams_in_grams` returns the amount of grams in n milligrams.

```ruby
3.milligrams_in_grams #=> 0.003
```

**Millimeters in Meters:**
`millimeter_in_meters` and `millimeters_in_meters` returns the amount of meters in n millimeters.

```ruby
3.millimeters_in_meters #=> 0.003
```

**Minutes in Seconds:**
`minute_in_seconds` and `minutes_in_seconds` returns the amount of seconds in n minutes.

```ruby
3.minutes_in_seconds #=> 180
```

**Multiply:**
`multiply` returns the multiplication of two numbers.

```ruby
4.multiply(2) #=> 8
```

**Multiple Of:**
`multiple_of?` returns true if a number can be evenly divided by n.

```ruby
9.multiple_of?(3) #=> true
7.multiple_of?(3) #=> false
```

**Nautical Miles in Inches:**
`nautical_mile_in_inches` and `nautical_miles_in_inches` returns the amount of inches in n nautical miles.

```ruby
3.nautical_miles_in_inches #=> 218740.26239999998
```

**Negative:**
`negative?` returns true if a number is less than zero.

```ruby
-1.negative? #=> true
1.negative? #=> false
```

**Ordinal:**
`ordinal` returns the suffix that should be added to a number to denote the position in an ordered sequence such as 1st, 2nd, 3rd, 4th.

```ruby
'1'.ordinal  #=> 'th'
'2'.ordinal  #=> 'nd'
'3'.ordinal  #=> 'rd'
'11'.ordinal #=> 'th'
```

**Ordinalize:**
`ordinalize` transforms a number into an ordinal string used to denote the position in an ordered sequence such as 1st, 2nd, 3rd, 4th.

```ruby
'1'.ordinalize  #=> '1th'
'2'.ordinalize  #=> '2nd'
'3'.ordinalize  #=> '3rd'
'11'.ordinalize #=> '4th'
```

**Ounces in Ounces:**
`ounce_in_ounces` and `ounces_in_ounces` returns self.

```ruby
3.ounces_in_ounces #=> 48
```

**Outside:**
`outside?` returns true if n is less than start or greater than finish.

```ruby
3.outside?(4, 5) #=> true
3.outside?(3, 5) #=> false
```

**Pad:**
`pad` returns a string representation of the number padded with pad_num to a specified length.

```ruby
3.pad                #=> '003'
3.pad(pad_number: 1) #=> '113'
3.pad(precision: 4)  #=> '0003'
```

**Pad Precision:**
`pad_precision` returns a string of padded after the '.' to n amount.

**Options**
 *  pad_number: 0
 *  precision: 2
 *  separator: '...'

```ruby
3.pad_precision                #=> '3.00'
3.5.pad_precision              #=> '3.50'
3.pad_precision(pad_number: 1) #=> '3.11'
```

**Percentage Of:**
`percentage_of` returns the percentage of a number in relation to another number.

```ruby
0.percentage_of(4) #=> 0
2.percentage_of(0) #=> 0
2.percentage_of(4) #=> 50.0
```

**Petabytes in Bytes:**
`petabyte_in_bytes` and `pegabytes_in_bytes` returns the amount of bytes in n petabytes.

```ruby
3.petabytes_in_bytes #=> 3377699720527872
```

**Positive:**
`positive?` returns true if a number is greater than zero.

```ruby
1.positive? #=> true
-1.positive? #=> false
```

**Pounds in Ounces:**
`pound_in_ounces` and `pounds_in_ounces` returns the amount of ounces in n pounds.

```ruby
3.pounds_in_ounces #=> 48
```

**Power:**
`power` returns the nth power of a number.

```ruby
4.power(2) #=> 16
```

**Root:**
`root` returns the nth root of a number.

```ruby
4.root(2) #=> 2
```

**Seconds in Seconds:**
`second_in_seconds` and `seconds_in_seconds` returns self.

```ruby
3.seconds #=> 3
```

**Stones in Ounces:**
`stone_in_ounces` and `stone_in_ounces` returns the amount of ounces in n stones.

```ruby
3.stones_in_ounces #=> 672
```

**Subtract:**
`subtract` returns the difference of two numbers.

```ruby
4.subtract(2) #=> 2
```

**Terabytes in Bytes:**
`terabyte_in_bytes` and `terabytes_in_bytes` returns the amount of bytes in n terabytes.

```ruby
3.terabytes_in_bytes #=> 3298534883328
```

**To Byte:**
`to_byte_in_bytes` converts a byte size from one unit to another unit.

```ruby
1.to_byte(:byte, :byte)          #=> 1 #B
5120.to_byte(:byte, :kilobyte)   #=> 5 #MB
1.to_byte(:megabyte, :kilobyte)  #=> 1024 #KB
80.to_byte(:megabyte, :gigabyte) #=> 0.078125 #GB
```

**To Currency:**
`to_currency` converts a number to currency string.

**Options**
 *  precision: 2
 *  unit: '$'

```ruby
3.to_currency            #=> '$3.00'
3.1.to_currency          #=> '$3.10'
3.11.to_currency         #=> '$3.11'
3.11111.to_currency      #=> '$3.11'
3.to_currency(unit: '@') #=> '@3.00'
```

**To Length:**
`to_length` converts a length from one unit to another unit.

```ruby
12.to_length(:inches, :feet)         #=> 12 #IN
3000.to_length(:meters, :kilometers) #=> 3 #KM
1.to_length(:feet, :centimeters)     #=> 30.479999999999997 #CM
1.to_length(:kilometer, :yards)      #=> 1093.6138888888888 #YDS
```

**To Mass:**
`to_mass` converts a mass from one unit to another unit.

```ruby
16.to_mass(:ounces, :pounds)        #=> 1 #LB
1.to_mass(:centigrams, :milligrams) #=> 10 #MG
3.to_mass(:pound, :kilogram)        #=> 1.360776 #KG
1.to_mass(:kilograms, :pounds)      #=> 2.204625 #LB
```

**To Nearest Value:**
`to_nearest value` return the value in values that is nearest to the number.

```ruby
5.to_nearest_value([1, 3, 6, 9])           #=> 6
3.5.to_nearest_value([3.0, 3.3, 3.6, 3.9]) #=> 3.6
```

**To Percantage:**
`to_percentage` converts a number to percentage string.

**Options**
 *  precision: 2
 *  unit: '%'

```ruby
3.to_percentage            #=> '3.00%'
3.1.to_percentage          #=> '3.10%'
3.11.to_percentage         #=> '3.11%'
3.11111.to_percentage      #=> '3.11%'
3.to_percentage(unit: '@') #=> '3.00@'
```

**To Temperature:**
`to_temperature` converts a temperature from one unit to another unit.

```ruby
100.to_temperature(:celsius, :fahrenheit) #=> 212 #F
212.to_temperature(:fahrenheit, :celsius) #=> 100 #C
212.to_temperature(:fahrenheit, :kelvin)  #=> 373.15 #K
```

**To Time:**
`to_time` converts a time unit from one unit to another unit.

```ruby
120.to_time(:seconds, :minutes) #=> 2 #MIN
3.to_time(:hours, :days)        #=> 3 #DAY
2.to_time(:days, :seconds)      #=> 172800 #SEC
1825.to_time(:days, :years)     #=> 4.996577686516085 #YR
```

**Tons in Ounces:**
`ton_in_ounces` and `ton_in_ounces` returns the amount of ounces in n tons.

```ruby
3.tons_in_ounces #=> 96000
```

**Weeks in Seconds:**
`week_in_seconds` and `weeks_in_seconds` returns the amount of seconds in n weeks.

```ruby
3.weeks_in_seconds #=> 1814400
```

**Within:**
`within?` determines if another number is approximately equal within a given epsilon

```ruby
10.006.within?(10, 0.1) #=>  true
```

**Yards in Inches:**
`yard_in_inches` and `yards_in_inches` returns the amount of inches in n yards.

```ruby
3.yards_in_inches #=> 108
```

**Years in Seconds:**
`year_in_seconds` and `years_in_seconds` returns the amount of seconds in n years.

```ruby
3.years_in_seconds #=> 94672800.0
```
