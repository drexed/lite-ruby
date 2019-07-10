# Hash

`assert_valid_keys(!)`
------
Raises an error if key is not included in a list of keys.

```ruby
{}.assert_valid_keys(:foo)                               #=> {}
{}.assert_valid_keys!(:foo)                              #=> raises ArgumentError: 'Empty hash. Valid keys are: :foo'
{ foo: 'bar' }.assert_valid_keys(:foo)                   #=> { foo: 'bar' }
{ foo: 'bar', baz: 'boz' }.assert_valid_keys(:foo, :boo) #=> raises ArgumentError: 'Unknown key: :baz. Valid keys are: :foo, :boo'
```

`bury`
------
Updates a deeply nested value.

```ruby
{ foo: { baz: 'boo' } }.bury(:foo, :moo)       #=> { foo: :moo }
{ foo: { baz: 'boo' } }.bury(:foo, :baz, :moo) #=> { foo: { baz: :moo } }
{ foo: { baz: 'boo' } }.bury(:foo)             #=> raises ArgumentError: '2 or more arguments required'
```

`collect_keys`
------
Returns an array with all keys converted using the block operation.

```ruby
{ foo: 'bar', 'baz' => :boo }.collect_keys                       #=> [:foo, 'baz']
{ foo: 'bar', 'baz' => :boo }.collect_keys { |k| k.to_s.upcase } #=> ['FOO', BAZ']
```

`collect_values`
------
Returns an array with all values converted using the block operation.

```ruby
{ foo: 'bar', baz: :boo }.collect_values                       #=> ['bar', :boo]
{ foo: 'bar', baz: :boo }.collect_values { |k| k.to_s.upcase } #=> ['BAR', BOO']
```

`compact(!)`
------
Returns a hash with non `nil` values.

```ruby
{}.compact                                   #=> {}
{ foo: nil }.compact                         #=> {}
{ foo: 'bar', baz: false, boo: nil }.compact #=> { foo: 'bar', baz: false }
```

`deep_merge(!)`
------
Returns a new hash with self and other_hash merged recursively.

```ruby
h1 = { a: true, b: { c: [1, 2, 3] } }
h2 = { a: false, b: { x: [3, 4, 5] } }

h1.deep_merge(h2) #=> { a: false, b: { c: [1, 2, 3], x: [3, 4, 5] } }
```

`demote(!)`
------
Moves a key value pair to the tail of the hash.

```ruby
{ a: 0, b: 1, c: 2 }.demote(:b)  #=> { a: 0, c: 2, b: 1 }
{ a: 0, b: 1, c: 2 }.demote!(:d) #=> { a: 0, b: 1, c: 2 }
```

`denillify(!)`
------
Converts `nil` into a given value.

```ruby
{ abc: nil, xyz: 1 }.denillify     #=> { abc: 0, xyz: 1 }
{ abc: nil, xyz: 1 }.denillify!(9) #=> { abc: 9, xyz: 1 }
```

`dig`
------
Returns the value of a nested element.

```ruby
h1 = { a: { b: { c: :d } } }

h1.dig(:a, :b)     #=> { c: :d }
h1.dig(:a, :b, :c) #=> :d
```

`except(!)`
------
Returns a hash that includes everything but the given keys.

```ruby
{}.except(:foo)                                                    #=> {}
{ foo: 'foo', baz: 'baz', bar: 'bar' }.except(:foo)                #=> { baz: 'baz', bar: 'bar' }
{ :foo => 'foo', :baz => 'baz', :bar => 'bar' }.except(:baz, :bar) #=> { :foo => 'foo' }
```

`extract!`
------
Removes and returns the key value pairs matching the given keys.

```ruby
{}.extract!(:foo)                                     #=> {}
{ foo: 'foo', baz: 'baz', bar: 'bar' }.extract!(:foo) #=> { foo: 'foo' }

```

`hmap(!)`
------
Returns a hash that is transformed in place.

```ruby
{ a: 1, b: 2, c: 3 }.hmap { |k, v| { k => v + 3 } } #=> { a: 4, b: 5, c: 6 }
```

`nillify(!)`
------
Transforms all blank values to `nil`.

```ruby
{ a: 1, b: 'test', c: nil, d: false, e: '', f: ' ' }.nillify #=> {a: 1, b: 'test', c: nil, d: nil, e: nil, f: nil}
```

`only(!)`
------
Returns only key value pairs matching certain keys.

```ruby
{}.only(:foo)                                                    #=> {}
{ foo: 'foo', baz: 'baz', bar: 'bar' }.only(:foo)                #=> { foo: 'foo' }
{ :foo => 'foo', :baz => 'baz', :bar => 'bar' }.only(:baz, :bar) #=> { :baz => 'baz', :bar => 'bar' }
```

`only_fill(!)`
------
Returns only key value pairs matching certain keys and any missing one.

```ruby
{}.only_fill(:foo)                                          #=> { foo: nil }
{ :foo => 1, baz: 2 }.only_fill(:foo, :bar, placeholder: 0) #=> { foo: 1, bar: 0 }
```

`pair?`
------
Returns if the hash has a key with a matching value.

```ruby
{ a: 0 }.pair?(:a, 0) #=> true
{ a: 0 }.pair?(:a, 2) #=> false
```

`promote(!)`
------
Moves a key value pair to the head of the hash.

```ruby
{ a: 0, b: 1, c: 2 }.promote(:b)  #=> { b: 1, a: 0, c: 2 }
{ a: 0, b: 1, c: 2 }.promote!(:d) #=> { a: 0, b: 1, c: 2 }
```

`rename_keys(!)`
------
Rename the keys of a hash.

```ruby
{ foo: 'foo', baz: 'baz' }.rename_keys(foo: :bar)                      #=> { bar: 'foo', baz: 'baz' }
{ foo: 'foo', 'baz' => 'baz' }.rename_keys(foo: :bar, 'baz' => 'tick') #=> { bar: 'foo', tick: 'baz' }
```

`reverse_merge(!)`
------
Merges one hash into other hash (merge but in reverse).

```ruby
{}.reverse_merge!(foo: 'bar')                         #=> { foo: 'bar' }
{ foo: 'bar' }.reverse_merge!(baz: 'boo', boo: 'bam') #=> { foo: 'bar', baz: 'boo', boo: 'bam' }
```

`sample(!)`
------
Returns a random key-value pair.

```ruby
h = { a: 1, b: 2, c: 3, d: 4 }

h.sample  #=> [:c, 3]
h.sample! #=> [:a, 1]
```

`sample_key(!)`
------
Returns a random key.

```ruby
h = { a: 1, b: 2, c: 3, d: 4 }

h.sample_key  #=> :b
h.sample_key! #=> :d
```

`sample_value(!)`
------
Returns a random value.

```ruby
h = { a: 1, b: 2, c: 3, d: 4 }

h.sample_value  #=> 1
h.sample_value! #=> 3
```

`shuffle(!)`
------
Returns a hash with values arranged in new random order.

```ruby
h = { a: 1, b: 2, c: 3, d: 4 }

h.shuffle  #=> { b: 2, c: 3, a: 1, d: 4 }
h.shuffle! #=> { d: 4, b: 2, c: 3, a: 1 }
```

`slice(!)`
------
Returns a hash that includes only the given keys.

```ruby
h = { a: 1, b: 2, c: 3, d: 4 }

h.slice(:a, :b)  #=> { a: 1, b: 2 }
h.slice!(:a, :b) #=> { c: 3, d: 4 }
```

`stringify_keys(!)`
------
Converts the hash keys to strings.

```ruby
{ foo: 'foo', 'bar' => 'bar' }.stringify_keys #=> { 'foo' => 'foo', 'baz' => 'baz' }
```

`strip(!)`
------
Returns a hash with non `nil`, `false`, or blank values.

```ruby
{}.strip                                                      #=> {}
{ foo: nil, baz: false, boo: '', faz: ' ' }.strip             #=> {}
{ foo: 'bar', baz: false, boo: nil, boz: '', faz: ' ' }.strip #=> { foo: 'bar' }
```

`symbolize_keys(!)`
------
Converts the hash keys to symbols.

```ruby
{ foo: 'foo', 'bar' => 'bar' }.symbolize_keys #=> { foo: 'foo', baz: 'baz' }
```

`symbolize_and_underscore_keys(!)`
------
Symbolize and underscore hash keys.

```ruby
{ 'firstName' => 'foo', 'last Name' => 'test' }.symbolize_and_underscore_keys #=> { first_name: 'foo', last_name: 'test' }
```

`to_o`
------
Converts an object to have an object like API.

```ruby
{ foo: { bar: true } }.to_o.foo.bar #=> true
```

`transform_keys(!)`
------
Returns a hash with all keys converted using the block operation.

```ruby
{ foo: 'bar', baz: 'boo' }.transform_keys { |k| k.to_s.upcase } #=> { 'FOO' => 'bar', 'BAZ' => 'boo' }
```

`transform_values(!)`
------
Returns a hash with all values converted using the block operation.

```ruby
{ foo: 'bar', baz: 'boo' }.transform_values { |v| v.to_s.upcase } #=> {foo: 'BAR', baz: 'BOO' }
```

`vacant?`
------
Returns if the value of a key is blank?.

```ruby
{}.vacant?(:foo)             #=> true
{ foo: ' ' }.vacant?(:foo)   #=> true
{ foo: 'bar' }.vacant?(:foo) #=> false
```
