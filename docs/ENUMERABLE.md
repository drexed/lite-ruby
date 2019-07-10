## Enumerable

`critical_zscore`
------
Returns the critical_zscore of elements of a collection.

```ruby
[].critical_zscore                              #=> nil
[].critical_zscore(0)                           #=> 0
[1, 2, 3, 4, 5, 6, 7, 8, 9, 10].critical_zscore #=> 2.29
```

`cluster`
------
clusters together adjacent elements into a list of sub-arrays.

```ruby
[2,2,2,3,3,4,2,2,1].cluster { |x| x } #=> [[2, 2, 2], [3, 3], [4], [2, 2], [1]]
```

`difference`
------
returns the difference of a collection of numbers. (Renamed from: difference)

```ruby
[].defference #=> 0
[].defference(nil) #=> nil
[1,2,3].defference #=> -4
```

`divisible`
------
returns the division of a collection of numbers.

```ruby
[].divisible       #=> 0
[].divisible(nil)  #=> nil
[16,4,2].divisible #=> 2
```

`drop_last`
------
drops the last number of elements of a collection.

```ruby
[].drop_last(1)      #=> []
[1,2,3].drop_last(1) #=> [1,2]
[1,2,3].drop_last(2) #=> [1]
```

`drop_last_if`
------
drops the last number of elements of a collection while it meets a criteria.

```ruby
[].drop_last_if(&:odd?)        #=> []
[1,2,3].drop_last_if(&:odd?)   #=> [1,2]
[1,2,3,4].drop_last_if(&:odd?) #=> [1,2,3,4]
```

`exactly?`
------
returns if there are exactly the number of an element type.

```ruby
[].exactly?(1)                 #=> false
[1,2,3].exactly?(3)            #=> true
[1,1,3,3].exactly?(2, &:even?) #=> false
```

`exclude?`
------
returns true if the collection does not include the object.

```ruby
[1, 2, 3].exclude?(4) #=> true
[1, 2, 3].exclude?(3) #=> false
```

`expand` expand all elements of an Enumerable object.

```ruby
[0, 2..3, 5..7].expand #=> [0,[2, 3],[5,6,7]]
```

`exponential`
------
returns the exponential of a collection of numbers.

```ruby
[].exponential      #=> 0
[].exponential(nil) #=> nil
[2,3,4].exponential #=> 4096
```

`incase?`
------
the same as #include? but tested using #=== instead of #==.

```ruby
[1, 2, 'a'].incase?(String) #=> true
[1, 2, 'a'].incase?(3)      #=> false
```

`interpose`
------
returns an enumerator to add seperators.

```ruby
[1, 2, 'a'].interpose(:sep).to_a #=> [1, :sep, 2, :sep, 'a']
```

`many?`
------
returns if collection has more than one element while respecting nil and false as an element.

```ruby
[].many?                 #=> false
[1,2,3].many?            #=> true
[1, false, nil].many?    #=> true
[1,1,3,3].many?(&:even?) #=> false

```

`mean` and `average`
------
returns the average of a collection of numbers.

```ruby
[].mean      #=> 0
[].mean(nil) #=> nil
[1,2,3].mean #=> 2
```

`median`
------
returns the middle value of a collection of numbers.

```ruby
[].median        #=> 0
[].median(nil)   #=> nil
[1,2,6].median   #=> 2
[1,2,3,6].median #=> 2.5
```

`mode`
------
returns the most frequent value of a collection of numbers.

```ruby
[].mode        #=> nil
[].mode(0)     #=> 0
[1,2,3].mode   #=> nil
[1,1,2,6].mode #=> 1
```

`multiple`
------
returns the multiplication of a collection of numbers.

```ruby
[].multiple      #=> 0
[].multiple(nil) #=> nil
[1,2,3].multiple #=> 6
```

`occurrences`
------
returns a hash of the number of times a value in an array appears.

```ruby
[].occurrences                                    #=> {}
[1, :symbol, 'string', 3, :symbol, 1].occurrences #=> { 1 => 2, :symbol => 2, 'string' => 1, 3 => 1 }
```

`percentile`
------
returns the percentile value for a given percentage.

```ruby
[].percentile(50)              # => 2
[].percentile(50, nil)         # => 3
[1, 2, 3, 4].percentile(50)    # => 2.5
[1, 2, 3, 4, 5].percentile(50) # => 3
```

`range`
------
returns the difference between the smallest and largest value of a collection of numbers.

```ruby
[].range      #=> 0
[].range(nil) #=> nil
[1,2,6].range #=> 5
```

`reject_outliers(!)`
------
removes the outliers of collection of numbers.

```ruby
[1, 2, 3, 30].reject_outliers #=> [1, 2, 3]
```

`select_outliers(!)`
------
select the outliers of collection of numbers.

```ruby
[1, 2, 3, 30].select_outliers #=> [30]
```

`several?`
------
returns if collection has more than one element while not respecting nil and false as an element.

```ruby
[].several?                 #=> false
[1,2,3].several?            #=> true
[1, false, nil].several?    #=> false
[1,1,3,3].several?(&:even?) #=> false
```

`standard_deviation`
------
returns the standard deviation of elements of a collection.

```ruby
[].standard_deviation      #=> 0
[].standard_deviation(nil) #=> nil
[1,2,6].standard_deviation #=> 2.6457513110645907
```

`sum`
------
returns the sum of a collection of numbers.

```ruby
[].sum             #=> 0
[1,2,3].sum        #=> 6
['foo', 'bar'].sum #=> 'foobar'
```

`take_last`
------
returns the last number of elements of a collection.

```ruby
[].take_last(1)      #=> []
[1,2,3].take_last(1) #=> [3]
[1,2,3].take_last(2) #=> [2,3]
```

`take_last_if`
------
returns the last number of elements of a collection while it meets a criteria.

```ruby
[].take_last_if(&:odd?)        #=> []
[1,2,3].take_last_if(&:odd?)   #=> [3]
[1,2,3,4].take_last_if(&:odd?) #=> []
```

`variance`
------
returns the variance of elements of a collection.

```ruby
[].variance      #=> 0
[].variance(nil) #=> nil
[1,2,6].variance #=> 7
```

`zscore`
------
returns the zscore of elements of a collection.

```ruby
[].zscore(3) #=> 0
[1, 2, 3, 4, 5, 6, 7, 8, 9, 10].zscore(3) #=> 0.8257228238447705
```
