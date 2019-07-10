# Integer

`factorial`
------
Calculates the factorial of an integer.

```ruby
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

`roman`
------
Converts an integer to a roman numeral.

```ruby
0.roman   #=> ''
49.roman  #=> 'XLIX'
-49.roman #=> '-XLIX'
```

`time`
------
Returns a Time object for the given Integer.

```ruby
3.time #=> '1969-12-31 19:00:03.000000000 -0500'
```
