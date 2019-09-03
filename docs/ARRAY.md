# Array

`assert_min_values!`
------
Raises an error if at least one value is not included in a list of values.

```ruby
[].assert_min_values!(:foo)                 #=> []
[:foo, :bar].assert_min_values!(:foo)       #=> [:foo]
[:baz, :bar].assert_min_values!(:foo, :boo) #=> raises ArgumentError: 'Missing value: ":foo". Minimum values are: ":foo", ":boo"'
```

`assert_all_min_values!`
------
Raises an error like `assert_min_values!` but also on empty.

```ruby
[].assert_all_min_values!(:foo) #=> raises ArgumentError: 'An empty array is not allowed'
```

`assert_valid_values!`
------
Raises an error if value is not included in a list of values.

```ruby
[].assert_valid_values!(:foo)                 #=> []
[:foo].assert_valid_values!(:foo)             #=> [:foo]
[:foo, :bar].assert_valid_values!(:foo, :boo) #=> raises ArgumentError: 'Invalid value: ":bar". Allowed values are: ":foo", ":boo"'
```

`assert_all_valid_values!`
------
Raises an error like `assert_valid_values!` but also on empty.

```ruby
[].assert_all_valid_values!(:foo) #=> raises ArgumentError: 'An empty array is not allowed'
```

`assert_value_presence!`
------
Raises an error if value is not `present?` or is nil.

```ruby
[].assert_value_presence!     #=> []
[:foo].assert_value_presence! #=> [:foo]
[nil].assert_value_presence!  #=> raises ArgumentError: 'A 'nil' value is not allowed'
```

`assert_all_value_presence!`
------
Raises an error like `assert_value_presence!` but also on empty.

```ruby
[].assert_all_value_presence! #=> raises ArgumentError: 'An empty array is not allowed'
```

`after`
------
Returns the value after a given value.

```ruby
['1', '2', '3'].after('2') #=> '3'
['1', '2', '3'].after('3') #=> '1'
['1', '2', '3'].after('4') #=> nil
```

`bury`
------
Updates a deeply nested value.

```ruby
['1', ['2']].bury(1, '3')    #=> ['1', '3']
['1', ['2']].bury(1, 0, '3') #=> ['1', ['3']]
['1', ['2']].bury(1)         #=> raises ArgumentError: '2 or more arguments required'
```

`before`
------
Returns the value before a given value.

```ruby
['1', '2', '3'].before('2') #=> '1'
['1', '2', '3'].before('1') #=> '3'
['1', '2', '3'].before('4') #=> nil
```

`delete_first(!)`
------
Removes the first element from an array. Like `shift`, but returns the array instead of the removed element.

```ruby
['1', '2', '3'].delete_first #=> ['2', '3']
```

`delete_last(!)`
------
Removes the last element from an array. Like `pop`, but returns the array instead of the removed element.

```ruby
['1', '2', '3'].delete_last #=> ['1', '2']
```

`delete_values`
------
Delete multiple values from array.

```ruby
[1, 2, 3, 4].delete_values(1, 3) #=> [2, 4]
```

`demote(!)`
------
Moves a given value to the tail of array.

```ruby
[1, 2, 2, 3].demote(2)  #=> [1, 3, 2, 2]
[1, 2, 2, 3].demote!(4) #=> [1, 2, 2, 3]
```

`denillify(!)`
------
Converts `nil` into a given value.

```ruby
[nil, 3, 4].denillify     #=> [0, 3, 4]
[nil, 3, 4].denillify!(9) #=> [9, 3, 4]
```

`duplicates`
------
Returns a list of duplicate elements.

```ruby
[1, 1, 2, 2, 2, 3].duplicates    #=> [1, 2]
[1, 1, 2, 2, 2, 3].duplicates(3) #=> [2]
```

`from`
------
Returns the tail of the array from a given position.

```ruby
['1', '2', '3'].from(0)  #=> ['1', '2', '3']
['1', '2', '3'].from(1)  #=> ['2', '3']
['1', '2', '3'].from(-1) #=> ['3']
```

`fulfill`
------
Returns an array filled to given size.

```ruby
['1', '2'].fulfill('x', 4) #=> ['1', '2', 'x', 'x']
```

`groups`
------
Splits or iterates over the array to a given number of groups.

```ruby
%w(1 2 3 4 5 6 7 8 9 10).groups(3) #=> [['1', '2', '3', '4'], ['5', '6', '7'], ['8', '9', '10']]
```

`in_groups`
------
Splits or iterates over the array to a given number of groups, padding any remaining slots with filler unless it is `false`.

```ruby
%w(1 2 3 4 5 6 7 8 9 10).in_groups(3)           #=> [['1', '2', '3', '4'], ['5', '6', '7', nil], ['8', '9', '10', nil]]
%w(1 2 3 4 5 6 7 8 9 10).in_groups(3, '&nbsp;') #=> [['1', '2', '3', '4'], ['5', '6', '7', '&nbsp;'], ['8', '9', '10', '&nbsp;']]
%w(1 2 3 4 5 6 7 8 9 10).in_groups(3, false)    #=> [['1', '2', '3', '4'], ['5', '6', '7'], ['8', '9', '10']]
```

`in_groups_of`
------
Splits or iterates over the array in groups of a given size number, padding any remaining slots with filler unless it is `false`.

```ruby
%w(1 2 3 4 5 6 7 8 9 10).in_groups_of(3)           #=> [['1', '2', '3'], ['4', '5', '6'], ['7', '8', '9'], ['10', nil, nil]]
%w(1 2 3 4 5 6 7 8 9 10).in_groups_of(3, '&nbsp;') #=> [['1', '2', '3'], ['4', '5', '6'], ['7', '8', '9'], ['10', '&nbsp;', '&nbsp;']]
%w(1 2 3 4 5 6 7 8 9 10).in_groups_of(3, false)    #=> [['1', '2', '3'], ['4', '5', '6'], ['7', '8', '9'], ['10']]
```

`indexes` aka `indicies`
------
Returns all indexes of the matching value.

```ruby
[:a,:b,:a,:c].indexes(:a) #=> [0, 2]
```

`merge(!)`
------
Concats multiple arrays.

```ruby
[1, 2].merge([3, 4], [5, 6]) #=> [1, 2, 3, 4, 5, 6]
```

`nillify(!)`
------
Converts blank values into `nil`.

```ruby
[nil, 3, 4].nillify #=> [nil, 3, 4]
[' ', 3, 4].nillify #=> [nil, 3, 4]
['', 3, 4].nillify! #=> [nil, 3, 4]
```

`probability`
------
Generates a hash mapping each unique element in the array to the relative frequency, i.e. the probability, of it appearance.

```ruby
[:a,:b,:c,:c].probability #=> { a: 0.25, b: 0.25, c: 0.5 }
```

`promote(!)`
------
Moves a given value to head of array.

```ruby
[1, 2, 2, 3].promote(2)  #=> [2, 2, 1, 3]
[1, 2, 2, 3].promote!(4) #=> [1, 2, 2, 3]
```

`position`
------
Returns the position of the first matching value.

```ruby
[:a,:b,:a,:c].position(:a) #=> 1
```

`positions`
------
Returns all of the positions of the matching value.

```ruby
[:a,:b,:a,:c].positions(:a) #=> [1, 3]
```

`reject_values`
------
Delete multiple values from a `dup` copy of the original array.

```ruby
[1, 2, 3, 4, 5].reject_values(2, 4) #=> [1, 3, 5]
```

`rposition`
------
Returns the position of the last matching value.

```ruby
[:a,:b,:a,:c].rposition(:a) #=> 3
```

`sample!`
------
Deletes a random value and returns that value.

```ruby
[1, 2, 3, 4, 5].sample! #=> 2
```

`split`
------
Divides the array into one or more subarrays based on a delimiting value or the result of an optional block.

```ruby
[1, 2, 3, 4, 5].split(3)              # => [[1, 2], [4, 5]]
(1..10).to_a.split { |i| i % 3 == 0 } # => [[1, 2], [4, 5], [7, 8], [10]]
```

`strip(!)`
------
Removes blank elements from an array.

```ruby
['this', '', 'that', nil, false].strip  #=> ['this', 'that']
'this    is   a  test'.split(' ').strip #=> ['this', 'is', 'a', 'test']
```

`swap`
------
Switches the places of two elements.

```ruby
[1, 2, 3].swap(0, 2) #=> [3, 2, 1]
```

`to`
------
Returns the beginning of the array up to a given position.

```ruby
['1', '2', '3'].to(0)  #=> ['1']
['1', '2', '3'].to(1)  #=> ['1', '2']
['1', '2', '3'].to(-1) #=> ['3']
```

`to_sentence`
------
Converts the array to a comma-separated sentence where the last element is joined by the connector word.

Option | Type | Default
--- | --- | ---
words_connector | string | ', '
two_words_connector | string | ' and '
last_word_connector | string | ', and '

```ruby
[].to_sentence                                                                                    #=> ''
['one'].to_sentence                                                                               #=> 'one'
['one', 'two'].to_sentence                                                                        #=> 'one and two'
['one', 'two', 'three'].to_sentence                                                               #=> 'one,two,and three'
['one', 'two'].to_sentence(two_words_connector: '-')                                              #=> 'one-two'
['one', 'two', 'three'].to_sentence(words_connector: ' or ',last_word_connector: ' or at least ') #=> 'one or two or at least three'
```
