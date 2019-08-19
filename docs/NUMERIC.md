# Numeric

`add`
------
Returns the sum of two numbers.

```ruby
4.add(2) #=> 6
```

`clamp`
------
Returns the closest number outside of the lower and upper bound.

```ruby
1.clamp(3, 6) # => 3
5.clamp(3..6) # => 5
8.clamp(3, 6) # => 6
```

`close?`
------
Returns if a number is within the degree of another.

```ruby
10.006.close?(10, 0.1) #=> true
```

`decrement`
------
Returns the n decremented number.

```ruby
1.decrement      #=> 0
1.decrement(0.5) #=> 0.5
```

`delta`
------
Returns the absolute difference between numbers.

```ruby
5.delta(3) #=> 2
3.delta(5) #=> 2
```

`delimit`
------
Returns a string representation of the number.

```ruby
5.delimit                                 #=> "1,000,000.1234"
3.delimit(delimiter: '.', separator: ',') #=> "1.000.000,1234"
```

`distance`
------
Returns the difference between numbers.

```ruby
5.distance(3) #=> 2
3.distance(5) #=> -2
```

`divide`
------
Returns the division of two numbers.

```ruby
4.divide(2) #=> 2
0.divide(2) #=> 0
4.divide(0) #=> 0
```

`equal_to?` aka `eq?`
------
Returns if matching equality using `==`.

```ruby
3.equal_to?(2) #=> false
3.equal_to?(3) #=> true
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

`greater_than?` aka `gt?`
------
Returns if self is greater than n.

```ruby
3.greater_than?(2) #=> true
3.greater_than?(3) #=> false
3.greater_than?(4) #=> false
```

`greater_than_or_equal_to?` aka `gteq?`
------
Returns if self is greater than or equal to n.

```ruby
3.greater_than_or_equal_to?(2) #=> true
3.greater_than_or_equal_to?(3) #=> true
3.greater_than_or_equal_to?(4) #=> false
```

`increment`
------
Returns the n incremented number.

```ruby
1.increment      #=> 2
1.increment(0.5) #=> 1.5
```

`inside?`
------
Returns if n is greater than start and less than finish.
Similar to between but does not return true if equal to self.

```ruby
3.inside?(1, 5) #=> true
3.inside?(3, 5) #=> false
```

`less_than?` aka `lt?`
------
Returns if self is less than n.

```ruby
3.less_than?(2) #=> false
3.less_than?(3) #=> false
3.less_than?(4) #=> true
```

`less_than_or_equal_to?` aka `lteq?`
------
Returns if self is less than or equal to n.

```ruby
3.less_than_or_equal_to?(2) #=> false
3.less_than_or_equal_to?(3) #=> true
3.less_than_or_equal_to?(4) #=> true
```

`markdown_percentage`
------
Returns the difference of a number and a percentage of it.

```ruby
4.markdown_percentage(25) #=> 3
```

`markup_percentage`
------
Returns the sum of a number and a percentage of it.

```ruby
4.markup_percentage(25) #=> 5
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

`not_equal_to?` aka `not_eq?` aka `inequal_to?` aka `ineq?`
------
Returns if not matching equality using `!=`.

```ruby
3.not_equal_to?(2) #=> true
3.not_equal_to?(3) #=> false
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

`power`
------
Returns the nth power of a number.

```ruby
4.power(2) #=> 16
```

`range` aka `plus_minus`
------
Returns a range from the number plus-or-minus a given value.

```ruby
4.range(2) #=> 2..6
```

`root`
------
Returns the nth root of a number.

```ruby
4.root(2) #=> 2
```

`round_down`
------
Returns a number rounded down to given value.

```ruby
2.128.round_down    #=> 2.0
2.128.round_down(2) #=> 2.12
2.round_down(2)     #=> 2.0
```

`subtract`
------
Returns the difference of two numbers.

```ruby
4.subtract(2) #=> 2
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

`within?`
------
Returns if another number is approximately equal within a given epsilon

```ruby
10.006.within?(10, 0.1) #=>  true
```
