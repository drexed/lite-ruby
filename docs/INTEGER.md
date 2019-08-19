# Integer

`bit`
------
Calculates the bit of an integer.

```ruby
0.bit(4)       #=> 16
10.bit(-4)     #=> 2
0b0100.bit(-3) #=> 0
```

`bit?`
------
Returns if it is a bit set.

```ruby
8.bit?(3) #=> true
8.bit?(2) #=> false
```

`bit_clear`
------
Clears a bit.

```ruby
4.bit_clear(2) #=> 0
```

`bitmask`
------
Calculates a bitmask of an integer.

```ruby
1.bitmask(6)  #=> 7
7.bitmask(~2) #=> 5
```

`bitmask?`
------
Returns if it is a bitmask set.

```ruby
8.bitmask?(3) #=> true
8.bitmask?(2) #=> false
```

`combinatorial`
------
Calculates the combinatorial of an integer to another integer.

```ruby
50.combinatorial(49) #=> 50
50.combinatorial(50) #=> 1
8.combinatorial(4)   #=> 70
```

`factorial`
------
Calculates the factorial of an integer.

```ruby
0.factorial #=> 0
1.factorial #=> 1
4.factorial #=> 24
```

`factors`
------
Calculates all the factors of an integer.

```ruby
24.factors #=> [1, 24, 2, 12, 3, 8, 4, 6]
```

`of`
------
Like `times` but returns a collection of the yield results.

```ruby
3.of { |i| i + 1 } #=> ['1', '2', '3']
```

`roman_numeral`
------
Converts an integer to a roman_numeral numeral.

```ruby
0.roman_numeral   #=> ''
49.roman_numeral  #=> 'XLIX'
-49.roman_numeral #=> '-XLIX'
```

`to_time` aka `to_t`
------
Returns a Time object for the given Integer.

```ruby
3.to_time #=> '1969-12-31 19:00:03.000000000 -0500'
```
