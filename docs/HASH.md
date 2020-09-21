# Hash

`zip`
------
Creates a new hash from two separate arrays.

```ruby
Hash.zip(%i[a b c], [1, 2, 3]) #=> { a: 1, b: 2, c: 3 }
```

`aka`
------
Adds a key/value pair from an existing key/value pair.

```ruby
h1 = { foo: 'bar', baz: 'boo' }
h1.aka('boo', :foo)

h1['boo'] #=> 'bar'
```

`assert_min_keys!`
------
Raises an error if at least one key is not included in a list of keys.

```ruby
{}.assert_min_keys!(:foo)                               #=> {}
{ foo: 'bar', bar: 'baz' }.assert_min_keys!(:foo)       #=> { foo: 'bar', bar: 'baz' }
{ baz: 'boz', bum: 'baz' }.assert_min_keys!(:foo, :boo) #=> raises ArgumentError: 'Missing key: ":foo". Minimum keys are: ":foo", ":boo"'
```

`assert_all_min_keys!`
------
Raises an error like `assert_min_values!` but also on empty.

```ruby
{}.assert_all_min_keys!(:foo) #=> raises ArgumentError: 'An empty hash is not allowed'
```

`assert_pair_presence!`
------
Raises an error if key is not included in a list of keys or if value is `blank?` or nil.

```ruby
{}.assert_pair_presence!(:foo)                   #=> {}
{ foo: 'bar' }.assert_pair_presence!(:foo)       #=> { foo: 'bar' }
{ foo: nil }.assert_pair_presence!(:foo)         #=> raises ArgumentError: 'A "nil" value for ":foo" is not allowed'
{ baz: 'boz' }.assert_pair_presence!(:foo, :boo) #=> raises ArgumentError: 'Invalid key: ":baz". Allowed keys are: ":foo", ":boo"'
```

`assert_all_pair_presence!`
------
Raises an error like `assert_pair_presence!` but also on empty.

```ruby
{}.assert_all_pair_presence!(:foo) #=> raises ArgumentError: 'An empty hash is not allowed'
```

`assert_valid_keys!`
------
Raises an error if key is not included in a list of keys.

```ruby
{}.assert_valid_keys!(:foo)                   #=> {}
{ foo: 'bar' }.assert_valid_keys!(:foo)       #=> { foo: 'bar' }
{ baz: 'boz' }.assert_valid_keys!(:foo, :boo) #=> raises ArgumentError: 'Invalid key: ":baz". Allowed keys are: ":foo", ":boo"'
```

`assert_all_valid_keys!`
------
Raises an error like `assert_valid_values!` but also on empty.

```ruby
{}.assert_all_valid_keys!(:foo) #=> raises ArgumentError: 'An empty hash is not allowed'
```

`assert_valid_values!`
------
Raises an error if value is not included in a list of values.

```ruby
{}.assert_valid_values!(:foo)                   #=> {}
{ foo: 'bar' }.assert_valid_values!('bar')      #=> { foo: 'bar' }
{ baz: 'boz' }.assert_valid_values!(:foo, :boo) #=> raises ArgumentError: 'Invalid value: "boz". Allowed values are: ":foo", ":boo"'
```

`assert_all_valid_values!`
------
Raises an error like `assert_valid_values!` but also on empty.

```ruby
{}.assert_all_valid_values!(:foo) #=> raises ArgumentError: 'An empty hash is not allowed'
```

`bury`
------
Updates a deeply nested value.

```ruby
{ foo: { baz: 'boo' } }.bury(:foo, :moo)       #=> { foo: :moo }
{ foo: { baz: 'boo' } }.bury(:foo, :baz, :moo) #=> { foo: { baz: :moo } }
{ foo: { baz: 'boo' } }.bury(:foo)             #=> raises ArgumentError: '2 or more arguments required'
```

`collate(!)`
------
Merge the values of this hash with those from another, setting all values to be arrays representing the values from both hashes.

```ruby
{ a: 1, b: 2 }.collate(a: 3, b: 4, c: 5) #=> { a: [1, 3], b: [2, 4], c: [5] }
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

`dearray_values(!)`
------
Any array values will be replaced with the first element of the array and arrays with no elements will be set to `nil`.

```ruby
h1 = { a: [1], b: [1, 2], c: 3, d: [] }

h1.dearray_values     #=> { a: 1, b: 1, c: 3, d: nil }
h1.dearray_values!(1) #=> { a: 1, b: 2, c: 3, d: nil }
```

`dearray_singular_values(!)`
------
Any array values with one or no elements will be set to the element or `nil`.

```ruby
h1 = { a: [1], b: [1, 2], c: 3, d: [] }

h1.dearray_singular_values #=> { a: 1, b: [1, 2], c: 3, d: nil }
```

`deep_merge(!)`
------
Returns a new hash with self and other_hash merged recursively.

```ruby
h1 = { a: true, b: { c: [1, 2, 3] } }
h2 = { a: false, b: { x: [3, 4, 5] } }

h1.deep_merge(h2) #=> { a: false, b: { c: [1, 2, 3], x: [3, 4, 5] } }
```

`delete_unless`
------
Inverse of `delete_if`.

```ruby
h1 = { a: 1, b: 2, c: 3 }
h1.delete_unless { |_, v| v == 1 }

h1 #=> { a: 1 }
```

`delete_values`
------
Delete key/value pairs by value.

```ruby
h1 = { a: 1, b: 2 }
h1.delete_values(1)

h1 #=> { b: 2 }
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

`diff`
------
Difference comparison of two hashes.

```ruby
h1 = { a: 1, b: 2 }
h2 = { a: 1, b: 3 }

h1.diff(h2) #=> { b: 2 }
h2.diff(h1) #=> { b: 3 }
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

`insert`
------
As with `store` but only if the key isn't already in the hash.

```ruby
h1 = { a: 1, b: 2 }

h1.insert(:c, 3) #=> true
h1.insert(:b, 3) #=> false
```

`invert`
------
Create an inverse hash by storing multiple values in arrays.

```ruby
h1 = { a: 3, b: 3, c: 3, d: 2, e: 9, f: 3, g: 9 }

h1.invert #=> { 2 => :d, 3 => %i[f c b a], 9 => %i[g e] }
```

`keys?` aka `has_keys?`
------
Returns if hash contains the given keys.

```ruby
h1 = { a: 0, b: 1 }

h1.keys?(:a, :b) #=> true
h1.keys?(:z)     #=> false
```

`nillify(!)`
------
Transforms all blank values to `nil`.

```ruby
{ a: 1, b: 'test', c: nil, d: false, e: '', f: ' ' }.nillify #=> {a: 1, b: 'test', c: nil, d: nil, e: nil, f: nil}
```

`only_fill(!)`
------
Returns only key value pairs matching certain keys and any missing one.

```ruby
{}.only_fill(:foo)                                          #=> { foo: nil }
{ :foo => 1, baz: 2 }.only_fill(:foo, :bar, placeholder: 0) #=> { foo: 1, bar: 0 }
```

`only_keys?` aka `has_only_keys?`
------
Returns if hash contains only the given keys.

```ruby
h1 = { a: 0, b: 1 }

h1.only_keys?(:a, :b) #=> true
h1.only_keys?(:a)     #=> false
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
{ foo: 'foo', baz: 'baz' }.rename_keys(foo: :bar)                       #=> { bar: 'foo', baz: 'baz' }
{ foo: 'foo', 'baz' => 'baz' }.rename_keys!(foo: :bar, 'baz' => 'tick') #=> { bar: 'foo', tick: 'baz' }
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

`slice(!)` aka `only(!)`
------
Returns a hash that includes only the given keys.

```ruby
h = { a: 1, b: 2, c: 3, d: 4 }

h.slice(:a, :b)  #=> { a: 1, b: 2 }
h.slice!(:a, :b) #=> { a: 1, b: 2 }
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

`to_object` aka `to_o`
------
Converts a hash and all nested hashes to open structs.

```ruby
{ foo: { bar: true } }.to_object.foo.bar #=> true
{ foo: { bar: true } }.to_object.foo.bax #=> nil
```

`to_open_struct`
------
Converts a hash to an open struct to have an object like API.

```ruby
{ foo: { bar: true } }.to_open_struct.foo #=> { bar: true }
{ foo: { bar: true } }.to_open_struct.bax #=> nil
```

`to_struct`
------
Converts a hash to a struct to have an object like API.

```ruby
{ foo: { bar: true } }.to_struct.foo #=> { bar: true }
{ foo: { bar: true } }.to_struct.bax #=> Raises error
```

`update_each`
------
Iterate over hash updating the key/value pair.

```ruby
{ a: 1, b: 2 }.update_each { |k, v| { "#{k}!" => v + 1 } } #=> { 'a!' => 2, 'b!' => 3 }
```

`update_keys`
------
Iterate over hash updating just the keys.

```ruby
{ a: 1, b: 2 }.update_keys { |k| "#{k}!" } #=> { 'a!' => 1, 'b!' => 2 }
```

`update_values`
------
Iterate over hash updating just the values.

```ruby
{ a: 1, b: 2 }.update_values { |v| v + 1 } #=> { a: 2, b: 3 }
```

`vacant?`
------
Returns if the value of a key is blank?.

```ruby
{}.vacant?(:foo)             #=> true
{ foo: ' ' }.vacant?(:foo)   #=> true
{ foo: 'bar' }.vacant?(:foo) #=> false
```
