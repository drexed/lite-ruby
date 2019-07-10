# Enumerable

`critical_zscore`
------
Returns the critical z-score of a collection of numbers.

```ruby
[].critical_zscore                     #=> nil
[].critical_zscore(0)                  #=> 0
[1,2,3,4,5,6,7,8,9,10].critical_zscore #=> 2.29
```

`cluster`
------
Groups together adjacent elements into a list of sub-arrays.

```ruby
[2,2,2,3,3,4,2,2,1].cluster { |x| x } #=> [[2,2,2],[3,3],[4],[2,2],[1]]
```

`defference`
------
Returns the difference of a collection of numbers.

```ruby
[].defference      #=> 0
[].defference(nil) #=> nil
[1,2,3].defference #=> -4
```

`divisible`
------
Returns the division of a collection of numbers.

```ruby
[].divisible       #=> 0
[].divisible(nil)  #=> nil
[16,4,2].divisible #=> 2
```

`drop_last`
------
Drops the last number of elements in a collection.

```ruby
[].drop_last(1)      #=> []
[1,2,3].drop_last(1) #=> [1,2]
[1,2,3].drop_last(2) #=> [1]
```

`drop_last_if`
------
Drops the last number of elements in a collection while it meets a criteria.

```ruby
[].drop_last_if(&:odd?)        #=> []
[1,2,3].drop_last_if(&:odd?)   #=> [1,2]
[1,2,3,4].drop_last_if(&:odd?) #=> [1,2,3,4]
```

`exactly?`
------
Returns if there are exactly the number of an element type.

```ruby
[].exactly?(1)                 #=> false
[1,2,3].exactly?(3)            #=> true
[1,1,3,3].exactly?(2, &:even?) #=> false
```

`excase?`
------
The same as `exclude?` but tested using `===` instead of `==`.

```ruby
[1,2,'a'].excase?(String) #=> false
[1,2,'a'].excase?(3)      #=> true
```

`exclude?`
------
Returns if the collection does not include an object.

```ruby
[1,2,3].exclude?(4) #=> true
[1,2,3].exclude?(3) #=> false
```

`expand`
------
Expand all elements of an Enumerable object.

```ruby
[0,2..3,5..7].expand #=> [0,[2,3],[5,6,7]]
```

`exponential`
------
Returns the exponential of a collection of numbers.

```ruby
[].exponential      #=> 0
[].exponential(nil) #=> nil
[2,3,4].exponential #=> 4096
```

`incase?`
------
The same as `include?` but tested using `===` instead of `==`.

```ruby
[1,2,'a'].incase?(String) #=> true
[1,2,'a'].incase?(3)      #=> false
```

`interpose`
------
Returns an Enumerator to add seperators.

```ruby
[1,2,'a'].interpose(:sep).to_a #=> [1,:sep,2,:sep,'a']
```

`many?`
------
Returns if a collection has more than one element while respecting `nil` and `false` as an element.

```ruby
[].many?                 #=> false
[1,2,3].many?            #=> true
[1,false,nil].many?      #=> true
[1,1,3,3].many?(&:even?) #=> false

```

`mean` aka `average`
------
Returns the average of a collection of numbers.

```ruby
[].mean      #=> 0
[].mean(nil) #=> nil
[1,2,3].mean #=> 2
```

`median`
------
Returns the middle value of a collection of numbers.

```ruby
[].median        #=> 0
[].median(nil)   #=> nil
[1,2,6].median   #=> 2
[1,2,3,6].median #=> 2.5
```

`mode`
------
Returns the most frequent value of a collection of numbers.

```ruby
[].mode        #=> nil
[].mode(0)     #=> 0
[1,2,3].mode   #=> nil
[1,1,2,6].mode #=> 1
```

`multiple`
------
Returns the multiplication of a collection of numbers.

```ruby
[].multiple      #=> 0
[].multiple(nil) #=> nil
[1,2,3].multiple #=> 6
```

`occurrences`
------
Returns a hash of the number of times a value appears in an array.

```ruby
[].occurrences                               #=> {}
[1,:symbol,'string',3,:symbol,1].occurrences #=> { 1 => 2,:symbol => 2,'string' => 1,3 => 1 }
```

`percentile`
------
Returns the percentile value for a collection of numbers.

```ruby
[].percentile(50)          # => 2
[].percentile(50,nil)      # => 3
[1,2,3,4].percentile(50)   # => 2.5
[1,2,3,4,5].percentile(50) # => 3
```

`range`
------
Returns the difference between the smallest and largest value for a collection of numbers.

```ruby
[].range      #=> 0
[].range(nil) #=> nil
[1,2,6].range #=> 5
```

`reject_outliers(!)`
------
Rejects the outliers of collection of numbers.

```ruby
[1,2,3,30].reject_outliers #=> [1,2,3]
```

`select_outliers(!)`
------
Selects the outliers of collection of numbers.

```ruby
[1,2,3,30].select_outliers #=> [30]
```

`several?`
------
Returns if collection has more than one element while not respecting `nil` and `false` as an element.

```ruby
[].several?                 #=> false
[1,2,3].several?            #=> true
[1,false,nil].several?      #=> false
[1,1,3,3].several?(&:even?) #=> false
```

`standard_deviation`
------
Returns the standard deviation of elements of a collection.

```ruby
[].standard_deviation      #=> 0
[].standard_deviation(nil) #=> nil
[1,2,6].standard_deviation #=> 2.6457513110645907
```

`sum`
------
Returns the sum of a collection.

```ruby
[].sum            #=> 0
[1,2,3].sum       #=> 6
['foo','bar'].sum #=> 'foobar'
```

`take_last`
------
Returns the last number of elements of a collection.

```ruby
[].take_last(1)      #=> []
[1,2,3].take_last(1) #=> [3]
[1,2,3].take_last(2) #=> [2,3]
```

`take_last_if`
------
Returns the last number of elements of a collection while it meets a criteria.

```ruby
[].take_last_if(&:odd?)        #=> []
[1,2,3].take_last_if(&:odd?)   #=> [3]
[1,2,3,4].take_last_if(&:odd?) #=> []
```

`variance`
------
Returns the variance of a collection of numbers.

```ruby
[].variance      #=> 0
[].variance(nil) #=> nil
[1,2,6].variance #=> 7
```

`zscore`
------
Returns the z-score of a collection of numbers.

```ruby
[].zscore(3) #=> 0
[1,2,3,4,5,6,7,8,9,10].zscore(3) #=> 0.8257228238447705
```
