# Numeric

`add`
------
Returns the sum of two numbers.

```ruby
4.add(2) #=> 6
```

`byte_in_bytes` aka `bytes_in_bytes`
------
Returns self as it's the lowest unit.

```ruby
3.bytes_in_bytes #=> 3
```

`centigram_in_grams` aka `centigrams_in_grams`
------
Returns the amount of grams in centigrams.

```ruby
3.centigrams_in_grams #=> 0.03
```

`centimeter_in_meters` aka `centimeters_in_meters`
------
Returns the amount of meters in centimeters.

```ruby
3.centimeters_in_meters #=> 0.03
```

`century_in_seconds` aka `centuries_in_seconds`
------
Returns the amount of seconds in centuries.

```ruby
3.centuries_in_seconds #=> 9467280000.0
```

`clamp`
------
Returns the closest number outside of the lower and upper bound.

```ruby
1.clamp(3, 6) # => 3
5.clamp(3..6) # => 5
8.clamp(3, 6) # => 6
```

`day_in_seconds` aka `days_in_seconds`
------
Returns the amount of seconds in days.

```ruby
3.days_in_seconds #=> 259200
```

`decade_in_seconds` aka `decades_in_seconds`
------
Returns the amount of seconds in decades.

```ruby
3.decades_in_seconds #=> 946728000.0
```

`decagram_in_grams` aka `decagrams_in_grams`
------
Returns the amount of grams in decagrams.

```ruby
3.decagrams_in_grams #=> 30
```

`decameter_in_meters` aka `decameters_in_meters`
------
Returns the amount of meters in decameters.

```ruby
3.decameters_in_meters #=> 30
```

`decigram_in_grams` aka `decigrams_in_grams`
------
Returns the amount of grams in decigrams.

```ruby
3.decigrams_in_grams #=> 0.3
```

`decimeter_in_meters` aka `decimeters_in_meters`
------
Returns the amount of meters in decimeters.

```ruby
3.decimeters_in_meters #=> 0.3
```

`degrees_to_radians`
------
Returns number of degrees into radians.

```ruby
90.degrees_to_radians #=> 1.5707963267948966
```

`distance`
------
Returns the absolute difference between numbers.

```ruby
5.distance(3) #=> 2
3.distance(5) #=> 2
```

`divide`
------
Returns the division of two numbers.

```ruby
4.divide(2) #=> 2
0.divide(2) #=> 0
4.divide(0) #=> 0
```

`exabyte_in_bytes` aka `exabytes_in_bytes`
------
Returns the amount of bytes in exabytes.

```ruby
3.exabytes_in_bytes #=> 3458764513820540928
```

`foot_in_inches` aka `feet_in_inches`
------
Returns the amount of inches in feet.

```ruby
3.feet_in_inches #=> 36
```

`fraction`
------
Returns the numbers after '.' of a float.

```ruby
1.0.fraction      #=> 0.0
12.2456.fraction  #=> 0.2456
-12.2456.fraction #=> 0.2456
```

`fraction?`
------
Returns if its a fraction.

```ruby
1.0.fraction?      #=> false
12.2456.fraction?  #=> true
```

`gigabyte_in_bytes` aka `gigabytes_in_bytes`
------
Returns the amount of bytes in gigabytes.

```ruby
3.gigabytes_in_bytes #=> 3221225472
```

`gram_in_grams` aka `grams_in_grams`
------
Returns self as it's the lowest unit.

```ruby
3.grams_in_grams #=> 3
```

`greater_than?`
------
Returns if self is greater than n.

```ruby
3.greater_than?(2) #=> true
3.greater_than?(3) #=> false
3.greater_than?(4) #=> false
```

`greater_than_or_equal_to?`
------
Returns if self is greater than or equal to n.

```ruby
3.greater_than_or_equal_to?(2) #=> true
3.greater_than_or_equal_to?(3) #=> true
3.greater_than_or_equal_to?(4) #=> false
```

`hectogram_in_grams` aka `hectograms_in_grams`
------
Returns the amount of grams in hectograms.

```ruby
3.hectograms_in_grams #=> 300
```

`hectometer_in_meters` aka `hectometers_in_meters`
------
Returns the amount of meters in hectometers.

```ruby
3.hectometers_in_meters #=> 300
```

`hour_in_seconds` aka `hours_in_seconds`
------
Returns the amount of seconds in hours.

```ruby
3.hours_in_seconds #=> 10800
```

`inch_in_inches` aka `inches_in_inches`
------
Returns the amount of inches in inches.

```ruby
3.inches_in_inches #=> 3
```

`inside?`
------
Returns if n is greater than start and less than finish.
Similar to between but does not return true if equal to self.

```ruby
3.inside?(1, 5) #=> true
3.inside?(3, 5) #=> false
```

`kilobyte_in_bytes` aka `kilobytes_in_bytes`
------
Returns the amount of bytes in kilobytes.

```ruby
3.kilobytes_in_bytes #=> 3072
```

`kilogram_in_grams` aka `kilograms_in_grams`
------
Returns the amount of grams in kilograms.

```ruby
3.kilograms_in_grams #=> 3000
```

`kilometer_in_meters` aka `kilometers_in_meters`
------
Returns the amount of meters in kilometers.

```ruby
3.kilometers_in_meters #=> 3000
```

`less_than?`
------
Returns if self is less than n.

```ruby
3.less_than?(2) #=> false
3.less_than?(3) #=> false
3.less_than?(4) #=> true
```

`less_than_or_equal_to?`
------
Returns if self is less than or equal to n.

```ruby
3.less_than_or_equal_to?(2) #=> false
3.less_than_or_equal_to?(3) #=> true
3.less_than_or_equal_to?(4) #=> true
```

`metric_ton_in_ounces` aka `metric_tons_in_ounces`
------
Returns the amount of grams in metric_tons.

```ruby
3.metric_tons_in_ounces #=> 3000000
```

`megabyte_in_bytes` aka `megabytes_in_bytes`
------
Returns the amount of bytes in megabytes.

```ruby
3.megabytes_in_bytes #=> 3145728
```

`meter_in_meters` aka `meters_in_meters`
------
Returns self as it's the lowest unit.

```ruby
3.meters_in_meters #=> 3
```

`mile_in_inches` aka `miles_in_inches`
------
Returns the amount of inches in miles.

```ruby
3.miles_in_inches #=> 190080
```

`millennium_in_seconds` aka `millenniums_in_seconds`
------
Returns the amount of seconds in millenniums.

```ruby
3.millenniums_in_seconds #=> 94672800000.0
```

`milligram_in_grams` aka `milligrams_in_grams`
------
Returns the amount of grams in milligrams.

```ruby
3.milligrams_in_grams #=> 0.003
```

`millimeter_in_meters` aka `millimeters_in_meters`
------
Returns the amount of meters in millimeters.

```ruby
3.millimeters_in_meters #=> 0.003
```

`minute_in_seconds` aka `minutes_in_seconds`
------
Returns the amount of seconds in minutes.

```ruby
3.minutes_in_seconds #=> 180
```

`multiply`
------
Returns the multiplication of two numbers.

```ruby
4.multiply(2) #=> 8
```

`multiple_of?`
------
Returns if a number can be evenly divided by n.

```ruby
9.multiple_of?(3) #=> true
7.multiple_of?(3) #=> false
```

`nautical_mile_in_inches` aka `nautical_miles_in_inches`
------
Returns the amount of inches in nautical miles.

```ruby
3.nautical_miles_in_inches #=> 218740.26239999998
```

`negative?`
------
Returns if a number is less than zero.

```ruby
-1.negative? #=> true
1.negative?  #=> false
```

`ordinal`
------
Returns the suffix that should be added to a number to denote the position in an ordered sequence such as 1st, 2nd, 3rd, 4th.

```ruby
'1'.ordinal  #=> 'th'
'2'.ordinal  #=> 'nd'
'3'.ordinal  #=> 'rd'
'11'.ordinal #=> 'th'
```

`ordinalize`
------
transforms a number into an ordinal string used to denote the position in an ordered sequence such as 1st, 2nd, 3rd, 4th.

```ruby
'1'.ordinalize  #=> '1th'
'2'.ordinalize  #=> '2nd'
'3'.ordinalize  #=> '3rd'
'11'.ordinalize #=> '4th'
```

`ounce_in_ounces` aka `ounces_in_ounces`
------
Returns self as it's the lowest unit.

```ruby
3.ounces_in_ounces #=> 48
```

`outside?`
------
Returns if n is less than start or greater than finish.

```ruby
3.outside?(4, 5) #=> true
3.outside?(3, 5) #=> false
```

`pad`
------
Returns a string representation of the number padded with pad_num to a specified length.

```ruby
3.pad                #=> '003'
3.pad(pad_number: 1) #=> '113'
3.pad(precision: 4)  #=> '0003'
```

`pad_precision`
------
Returns a string of padded after the '.' to n amount.

Option | Type | Default
--- | --- | ---
pad_number | integer | 0
precision | integer | 2
separator | string | '...'

```ruby
3.pad_precision                #=> '3.00'
3.5.pad_precision              #=> '3.50'
3.pad_precision(pad_number: 1) #=> '3.11'
```

`percentage_of`
------
Returns the percentage of a number in relation to another number.

```ruby
0.percentage_of(4) #=> 0
2.percentage_of(0) #=> 0
2.percentage_of(4) #=> 50.0
```

`petabyte_in_bytes` aka `pegabytes_in_bytes`
------
Returns the amount of bytes in petabytes.

```ruby
3.petabytes_in_bytes #=> 3377699720527872
```

`positive?`
------
Returns if a number is greater than zero.

```ruby
1.positive?  #=> true
-1.positive? #=> false
```

`pound_in_ounces` aka `pounds_in_ounces`
------
Returns the amount of ounces in pounds.

```ruby
3.pounds_in_ounces #=> 48
```

`power`
------
Returns the nth power of a number.

```ruby
4.power(2) #=> 16
```

`root`
------
Returns the nth root of a number.

```ruby
4.root(2) #=> 2
```

`second_in_seconds` aka `seconds_in_seconds`
------
Returns self as it's the lowest unit.

```ruby
3.seconds #=> 3
```

`stone_in_ounces` aka `stone_in_ounces`
------
Returns the amount of ounces in stones.

```ruby
3.stones_in_ounces #=> 672
```

`subtract`
------
Returns the difference of two numbers.

```ruby
4.subtract(2) #=> 2
```

`terabyte_in_bytes` aka `terabytes_in_bytes`
------
Returns the amount of bytes in terabytes.

```ruby
3.terabytes_in_bytes #=> 3298534883328
```

`to_byte`
------
Converts a byte size from one unit to another unit.

```ruby
1.to_byte(:byte, :byte)          #=> 1 #B
5120.to_byte(:byte, :kilobyte)   #=> 5 #MB
1.to_byte(:megabyte, :kilobyte)  #=> 1024 #KB
80.to_byte(:megabyte, :gigabyte) #=> 0.078125 #GB
```

`to_currency`
------
Converts a number to currency string.

Option | Type | Default
--- | --- | ---
precision | integer | 2
unit | string | '$'

```ruby
3.to_currency            #=> '$3.00'
3.1.to_currency          #=> '$3.10'
3.11.to_currency         #=> '$3.11'
3.11111.to_currency      #=> '$3.11'
3.to_currency(unit: '@') #=> '@3.00'
```

`to_length`
------
Converts a length from one unit to another unit.

```ruby
12.to_length(:inches, :feet)         #=> 12 #IN
3000.to_length(:meters, :kilometers) #=> 3 #KM
1.to_length(:feet, :centimeters)     #=> 30.479999999999997 #CM
1.to_length(:kilometer, :yards)      #=> 1093.6138888888888 #YDS
```

`to_mass`
------
Converts a mass from one unit to another unit.

```ruby
16.to_mass(:ounces, :pounds)        #=> 1 #LB
1.to_mass(:centigrams, :milligrams) #=> 10 #MG
3.to_mass(:pound, :kilogram)        #=> 1.360776 #KG
1.to_mass(:kilograms, :pounds)      #=> 2.204625 #LB
```

`to_nearest value`
------
return the value in values that is nearest to the number.

```ruby
5.to_nearest_value([1, 3, 6, 9])           #=> 6
3.5.to_nearest_value([3.0, 3.3, 3.6, 3.9]) #=> 3.6
```

`to_percentage`
------
Converts a number to percentage string.

Option | Type | Default
--- | --- | ---
precision | integer | 2
unit | string | '%'

```ruby
3.to_percentage            #=> '3.00%'
3.1.to_percentage          #=> '3.10%'
3.11.to_percentage         #=> '3.11%'
3.11111.to_percentage      #=> '3.11%'
3.to_percentage(unit: '@') #=> '3.00@'
```

`to_temperature`
------
Converts a temperature from one unit to another unit.

```ruby
100.to_temperature(:celsius, :fahrenheit) #=> 212 #F
212.to_temperature(:fahrenheit, :celsius) #=> 100 #C
212.to_temperature(:fahrenheit, :kelvin)  #=> 373.15 #K
```

`to_time`
------
Converts a time unit from one unit to another unit.

```ruby
120.to_time(:seconds, :minutes) #=> 2 #MIN
3.to_time(:hours, :days)        #=> 3 #DAY
2.to_time(:days, :seconds)      #=> 172800 #SEC
1825.to_time(:days, :years)     #=> 4.996577686516085 #YR
```

`ton_in_ounces` aka `ton_in_ounces`
------
Returns the amount of ounces in tons.

```ruby
3.tons_in_ounces #=> 96000
```

`week_in_seconds` aka `weeks_in_seconds`
------
Returns the amount of seconds in weeks.

```ruby
3.weeks_in_seconds #=> 1814400
```

`within?`
------
Returns if another number is approximately equal within a given epsilon

```ruby
10.006.within?(10, 0.1) #=>  true
```

`yard_in_inches` aka `yards_in_inches`
------
Returns the amount of inches in yards.

```ruby
3.yards_in_inches #=> 108
```

`year_in_seconds` aka `years_in_seconds`
------
Returns the amount of seconds in years.

```ruby
3.years_in_seconds #=> 94672800.0
```
