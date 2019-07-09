# Array

* `after` returns the value after the given value.

```ruby
['1', '2', '3'].after('2') #=> '3'
['1', '2', '3'].after('3') #=> '1'
['1', '2', '3'].after('4') #=> nil
```

* `bury` updates a deeply nested value.

```ruby
['1', ['2']].bury(1, '3')    #=> ['1', '3']
['1', ['2']].bury(1, 0, '3') #=> ['1', ['3']]
['1', ['2']].bury(1)         #=> raises ArgumentError: '2 or more arguments required'
```

* `before` returns the value before the given value.

```ruby
['1', '2', '3'].before('2') #=> '1'
['1', '2', '3'].before('1') #=> '3'
['1', '2', '3'].before('4') #=> nil
```

* `delete_first` and `delete_first!` removes the first element from an array. Like Array.shift, but returns the array instead of the removed element.

```ruby
['1', '2', '3'].delete_first #=> ['2', '3']
```

* `delete_last` and `delete_last!` removes the last element from an array. Like Array.pop, but returns the array instead of the removed element.

```ruby
['1', '2', '3'].delete_last #=> ['1', '2']
```

* `delete_values` delete multiple values from array.

```ruby
[1, 2, 3, 4].delete_values(1, 3) #=> [2, 4]
```

* `demote` and `demote!` moves given value to tail of array.

```ruby
[1, 2, 2, 3].demote(2)  #=> [1, 3, 2, 2]
[1, 2, 2, 3].demote!(4) #=> [1, 2, 2, 3]
```

* `denillify` and `denillify!` converts nils into a given value.

```ruby
[nil, 3, 4].denillify  #=> [0, 3, 4]
[nil, 3, 4].denillify!(9) #=> [9, 3, 4]
```

* `dig` returns the value of a nested array.

```ruby
['zero', ['ten', 'eleven', 'twelve'], 'two'].dig(1, 2) #=> 'twelve'
```

* `duplicates` returns list of duplicate elements.

```ruby
[1, 1, 2, 2, 2, 3].duplicates    #=> [1, 2]
[1, 1, 2, 2, 2, 3].duplicates(3) #=> [2]
```

* `from` returns the tail of the array from position.

```ruby
['1', '2', '3'].from(0) #=> ['1', '2', '3']
['1', '2', '3'].from(1) #=> ['2', '3']
['1', '2', '3'].from(-1) #=> ['3']
```

* `fulfill` returns an array filled to given size.

```ruby
['1', '2'].fulfill('x', 4) #=> ['1', '2', 'x', 'x']
```

* `groups` splits or iterates over the array in number of groups.

```ruby
%w(1 2 3 4 5 6 7 8 9 10).groups(3) #=> [['1', '2', '3', '4'], ['5', '6', '7'], ['8', '9', '10']]
```

* `in_groups` splits or iterates over the array in number of groups, padding any remaining slots with fill_with unless it is false.

```ruby
%w(1 2 3 4 5 6 7 8 9 10).in_groups(3)           #=> [['1', '2', '3', '4'], ['5', '6', '7', nil], ['8', '9', '10', nil]]
%w(1 2 3 4 5 6 7 8 9 10).in_groups(3, '&nbsp;') #=> [['1', '2', '3', '4'], ['5', '6', '7', '&nbsp;'], ['8', '9', '10', '&nbsp;']]
%w(1 2 3 4 5 6 7 8 9 10).in_groups(3, false)    #=> [['1', '2', '3', '4'], ['5', '6', '7'], ['8', '9', '10']]
```

* `in_groups_of` splits or iterates over the array in groups of size number, padding any remaining slots with fill_with unless it is false.

```ruby
%w(1 2 3 4 5 6 7 8 9 10).in_groups_of(3)           #=> [['1', '2', '3'], ['4', '5', '6'], ['7', '8', '9'], ['10', nil, nil]]
%w(1 2 3 4 5 6 7 8 9 10).in_groups_of(3, '&nbsp;') #=> [['1', '2', '3'], ['4', '5', '6'], ['7', '8', '9'], ['10', '&nbsp;', '&nbsp;']]
%w(1 2 3 4 5 6 7 8 9 10).in_groups_of(3, false)    #=> [['1', '2', '3'], ['4', '5', '6'], ['7', '8', '9'], ['10']]
```

* `indexes` returns all the indexes of the matching value.

```ruby
[:a, :b, :a, :c].indexes(:a) #=> [0, 2]
```

* `merge` concats multiple arrays.

```ruby
[1, 2].merge([3, 4], [5, 6]) #=> [1, 2, 3, 4, 5, 6]
```

* `nillify` and `nillify!` converts blank values into nils.

```ruby
[' ', 3, 4].nillify #=> [nil, 3, 4]
['', 3, 4].nillify! #=> [nil, 3, 4]
```

* `probability` generates a hash mapping each unique element in the array to the relative frequency, i.e. the probability, of it appearance.

```ruby
[:a, :b, :c, :c].probability #=> { a: 0.25, b: 0.25, c: 0.5 }
```

* `promote` and `promote!` moves given value to head of array.

```ruby
[1, 2, 2, 3].promote(2)  #=> [2, 2, 1, 3]
[1, 2, 2, 3].promote!(4) #=> [1, 2, 2, 3]
```

* `position` returns the position of the first matching value.

```ruby
[:a, :b, :a, :c].position(:a) #=> 1
```

* `positions` returns all the positions of the matching value.

```ruby
[:a, :b, :a, :c].positions(:a) #=> [1, 3]
```

* `reject_values` delete multiple values from array from a array copy.

```ruby
[1, 2, 3, 4, 5].reject_values(2,4) #=> [1, 3, 5]
```

* `rposition` returns the position of the last matching value.

```ruby
[:a, :b, :a, :c].rposition(:a) #=> 3
```

* `sample!` deletes a random value and returns that value.

```ruby
[1, 2, 3, 4, 5].sample! #=> 2
```

* `split` divides the array into one or more subarrays based on a delimiting value or the result of an optional block.

```ruby
[1, 2, 3, 4, 5].split(3)              # => [[1, 2], [4, 5]]
(1..10).to_a.split { |i| i % 3 == 0 } # => [[1, 2], [4, 5], [7, 8], [10]]
```

* `strip` and `strip!` removes blank elements from an array.

```ruby
['this', '', 'that', nil, false].strip  #=> ['this', 'that']
'this    is   a  test'.split(' ').strip #=> ['this', 'is', 'a', 'test']
```

* `swap` switches places of two elements.

```ruby
[1, 2, 3].swap(0, 2) #=> [3, 2, 1]
```

* `to` returns the beginning of the array up to position.

```ruby
['1', '2', '3'].to(0) #=> ['1']
['1', '2', '3'].to(1) #=> ['1', '2']
['1', '2', '3'].to(-1) #=> ['3']
```

* `to_sentence` converts the array to a comma-separated sentence where the last element is joined by the connector word.

 * words_connector:     “, ”
 * two_words_connector: “ and ”
 * last_word_connector: “, and ”

```ruby
[].to_sentence                                                                                     #=> ''
['one'].to_sentence                                                                                #=> 'one'
['one', 'two'].to_sentence                                                                         #=> 'one and two'
['one', 'two', 'three'].to_sentence                                                                #=> 'one, two, and three'
['one', 'two'].to_sentence(two_words_connector: '-')                                               #=> 'one-two'
['one', 'two', 'three'].to_sentence(words_connector: ' or ', last_word_connector: ' or at least ') #=> 'one or two or at least three'
```
