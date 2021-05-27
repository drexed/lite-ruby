# Enumerable

`cluster`
------
Groups together adjacent elements into a list of sub-arrays.

```ruby
[2, 2, 2, 3, 3, 4, 2, 2, 1].cluster { |x| x } #=> [[2, 2, 2], [3, 3], [4], [2, 2], [1]]
```

`cluster_by`
------
Similar to `group_by` but returns an array of the groups.

```ruby
%w[this is a test].cluster_by { |x| x[0] } #=> [['a'], ['is'], ['this', 'test']]
```

`deduce`
------
Returns the difference of a collection of numbers.

```ruby
[].deduce      #=> 0
[].deduce(nil) #=> nil
[1,2,3].deduce #=> -4
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

`excluding` aka `without`
------
Returns the object without the given keys.

```ruby
[1, 2, 3].excluding(2, 3)                        #=> [1]
{ foo: 1, bar: 2, baz: 3 }.excluding(:foo, :baz) #=> { bar: 2 }
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

`frequency` aka `occurrences`
------
Generates a hash mapping each unique symbol in the array to the absolute frequency it appears.

```ruby
%i[a a b c c c].frequency #=> { a: 2, b: 1, c: 3 }
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

`including` aka `with`
------
Returns an array with the given values.

```ruby
[1, 2, 3].including(4, 5) #=> [1,2,3,4,5]
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

`occur`
------
Returns an array of elements for the elements that occur n times.

```ruby
a1 = [1,1,2,3,3,4,5,5]

a1.occur(2)            #=> [1,3,5]
a1.occur(2..3)         #=> [1,3,5]
a1.occur { |n| n > 1 } #=> [1,3,5]
```

`pick`
------
Returns a value from a set of given keys.

```ruby
a1 = [{ id: 1, name: 'a' }, { id: 2, name: 'b' }]

a1.pick(:id)        #=> 1
a1.pick(:id, :name) #=> [1,'a']
a1.pick(:fake)      #=> nil
```

`pluck`
------
Returns an array of values from a set of given keys.

```ruby
a1 = [{ id: 1, name: 'a' }, { id: 2, name: 'b' }]

a1.pluck(:id)        #=> [1,2]
a1.pluck(:id, :name) #=> [[1,'a'], [2,'b']]
a1.pluck(:fake)      #=> [nil,nil]
```

`produce`
------
Returns the multiplication of a collection of numbers.

```ruby
[].produce      #=> 0
[].produce(nil) #=> nil
[1,2,3].produce #=> 6
```

`quotient`
------
Returns the division of a collection of numbers.

```ruby
[].quotient       #=> 0
[].quotient(nil)  #=> nil
[16,4,2].quotient #=> 2
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

`squeeze`
------
Squeeze out the same elements.

```ruby
a1 = [1,2,2,3,3,2,1]

a1.squeeze      #=> [1,2,3,2,1]
a1.sort.squeeze #=> [1,2,3]
a1.squeeze(3)   #=> [1,2,2,3,2,1]
```

`take_last`
------
Returns the last number of elements of a collection.

```ruby
[].take_last(1)      #=> []
[1,2,3].take_last(1) #=> [3]
[1,2,3].take_last(2) #=> [2, 3]
```

`take_last_if`
------
Returns the last number of elements of a collection while it meets a criteria.

```ruby
[].take_last_if(&:odd?)        #=> []
[1,2,3].take_last_if(&:odd?)   #=> [3]
[1,2,3,4].take_last_if(&:odd?) #=> []
```
