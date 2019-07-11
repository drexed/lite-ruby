## Range

`combine`
------
Returns two concatenated ranges.

```ruby
(1..3).combine(7..9) #=> [1, 2, 3, 7, 8, 9]
```

`include_with_range?`
------
Returns if a range is within another open ended range.

```ruby
(1..5).include_with_range?(1)    # => true
(1..5).include_with_range?(2..3) # => true
(1..5).include_with_range?(7)    # => false
(1..5).include_with_range?(2..6) # => false
```

`overlaps?`
------
Returns if two ranges overlap each other.

```ruby
(1..5).overlaps?(4..6) # => true
(1..5).overlaps?(7..9) # => false
```

`sample`
------
Returns a random element from the range.

```ruby
(1..5).sample # => 4
```

`shuffle(!)`
------
Returns a copy of a shuffled range of elements.

```ruby
(1..5).shuffle  # => [2, 5, 1, 4, 3]
(1..5).shuffle! # => [3, 4, 5, 2, 1]
```

`within?`
------
Returns if one range is within another.

```ruby
(1..5).within?(2..4) # => true
(1..5).within?(4..6) # => false
```
