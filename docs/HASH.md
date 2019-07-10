## Hash

**Assert Valid Keys:**
`assert_valid_keys` and `assert_valid_keys!` raises an error if key is not included in a list of keys.

```ruby
{}.assert_valid_keys(:foo)                               #=> {}
{}.assert_valid_keys!(:foo)                              #=> raises ArgumentError: 'Empty hash. Valid keys are: :foo'
{ foo: 'bar' }.assert_valid_keys(:foo)                   #=> { foo: 'bar' }
{ foo: 'bar', baz: 'boz' }.assert_valid_keys(:foo, :boo) #=> raises ArgumentError: 'Unknown key: :baz. Valid keys are: :foo, :boo'
```

**Bury:**
`bury` updates a deeply nested value.

```ruby
{ foo: { baz: 'boo' } }.bury(:foo, :moo)       #=> { foo: :moo }
{ foo: { baz: 'boo' } }.bury(:foo, :baz, :moo) #=> { foo: { baz: :moo } }
{ foo: { baz: 'boo' } }.bury(:foo)             #=> raises ArgumentError: '2 or more arguments required'
```

**Collect Keys:**
`collect_keys` returns an array with all keys converted using the block operation.

```ruby
{ foo: 'bar', 'baz' => :boo }.collect_keys                       #=> [:foo, 'baz']
{ foo: 'bar', 'baz' => :boo }.collect_keys { |k| k.to_s.upcase } #=> ['FOO', BAZ']
```

**Collect Values:**
`collect_values` returns an array with all values converted using the block operation.

```ruby
{ foo: 'bar', baz: :boo }.collect_values                       #=> ['bar', :boo]
{ foo: 'bar', baz: :boo }.collect_values { |k| k.to_s.upcase } #=> ['BAR', BOO']
```

**Compact:**
`compact` and `compact!` returns a hash with non nil values.

```ruby
{}.compact                                   #=> {}
{ foo: nil }.compact                         #=> {}
{ foo: 'bar', baz: false, boo: nil }.compact #=> { foo: 'bar', baz: false }
```

**Deep Merge:**
`deep_merge` and `deep_merge!` returns a new hash with self and other_hash merged recursively.

```ruby
h1 = { a: true, b: { c: [1, 2, 3] } }
h2 = { a: false, b: { x: [3, 4, 5] } }

h1.deep_merge(h2) #=> { a: false, b: { c: [1, 2, 3], x: [3, 4, 5] } }
```

**Demote:**
`demote` and `demote!` moves a key value pair to the tail of the hash.

```ruby
{ a: 0, b: 1, c: 2 }.demote(:b)  #=> { a: 0, c: 2, b: 1 }
{ a: 0, b: 1, c: 2 }.demote!(:d) #=> { a: 0, b: 1, c: 2 }
```

**Denillify:**
`denillify` and `denillify!` converts nils into a given value.

```ruby
{ abc: nil, xyz: 1 }.denillify     #=> { abc: 0, xyz: 1 }
{ abc: nil, xyz: 1 }.denillify!(9) #=> { abc: 9, xyz: 1 }
```

**Dig:**
`dig` returns the value of a nested hash.

```ruby
h1 = { a: { b: { c: :d } } }

h1.dig(:a, :b)     #=> { c: :d }
h1.dig(:a, :b, :c) #=> :d
```

**Except:**
`except` and `except!` returns a hash that includes everything but the given keys.

```ruby
{}.except(:foo)                                                    #=> {}
{ foo: 'foo', baz: 'baz', bar: 'bar' }.except(:foo)                #=> { baz: 'baz', bar: 'bar' }
{ :foo => 'foo', :baz => 'baz', :bar => 'bar' }.except(:baz, :bar) #=> { :foo => 'foo' }
```

**Extract:**
`extract!` removes and returns the key/value pairs matching the given keys.

```ruby
{}.extract!(:foo)                                     #=> {}
{ foo: 'foo', baz: 'baz', bar: 'bar' }.extract!(:foo) #=> { foo: 'foo' }

```

**Hmap:**
`hmap` and `hmap!` returns a hash that is transformed in place.

```ruby
{ a: 1, b: 2, c: 3 }.hmap { |k, v| { k => v + 3 } } #=> { a: 4, b: 5, c: 6 }
```

**Nillify:**
`nillify` and `nillify!` transforms all blank values to nil.

```ruby
{ a: 1, b: 'test', c: nil, d: false, e: '', f: ' ' }.nillify #=> {a: 1, b: 'test', c: nil, d: nil, e: nil, f: nil}
```

**Only:**
`only` and `only!` returns only key/value pairs matching certain keys.

```ruby
{}.only(:foo)                                                    #=> {}
{ foo: 'foo', baz: 'baz', bar: 'bar' }.only(:foo)                #=> { foo: 'foo' }
{ :foo => 'foo', :baz => 'baz', :bar => 'bar' }.only(:baz, :bar) #=> { :baz => 'baz', :bar => 'bar' }
```

**Only fill:**
`only_fill` and `only_fill!` returns only key/value pairs matching certain keys and any missing one.

```ruby
{}.only_fill(:foo)                                          #=> { foo: nil }
{ :foo => 1, baz: 2 }.only_fill(:foo, :bar, placeholder: 0) #=> { foo: 1, bar: 0 }
```

**Pair?:**
`pair?` checks if the hash has a key with a matching value.

```ruby
{ a: 0 }.pair?(:a, 0) #=> true
{ a: 0 }.pair?(:a, 2) #=> false
```

**Promote:**
`promote` and `promote!` moves a key value pair to the head of the hash.

```ruby
{ a: 0, b: 1, c: 2 }.promote(:b)  #=> { b: 1, a: 0, c: 2 }
{ a: 0, b: 1, c: 2 }.promote!(:d) #=> { a: 0, b: 1, c: 2 }
```

**Rename Keys:**
`rename_keys` and `rename_keys!` rename the keys of a hash.

```ruby
{ foo: 'foo', baz: 'baz' }.rename_keys(foo: :bar)                      #=> { bar: 'foo', baz: 'baz' }
{ foo: 'foo', 'baz' => 'baz' }.rename_keys(foo: :bar, 'baz' => 'tick') #=> { bar: 'foo', tick: 'baz' }
```

**Reverse Merge:**
`reverse_merge` and `reverse_merge!` merges one hash into other hash.

```ruby
{}.reverse_merge!(foo: 'bar')                         #=> { foo: 'bar' }
{ foo: 'bar' }.reverse_merge!(baz: 'boo', boo: 'bam') #=> { foo: 'bar', baz: 'boo', boo: 'bam' }
```

**Sample:**
`sample` returns a random key-value pair.
`sample!` deletes a random key-value pair and returns that pair.

```ruby
h = { a: 1, b: 2, c: 3, d: 4 }

h.sample  #=> [:c, 3]
h.sample! #=> [:a, 1]
```

**Sample Key:**
`sample_key` returns a random key.
`sample_key!` delete a random key-value pair, returning the key.

```ruby
h = { a: 1, b: 2, c: 3, d: 4 }

h.sample_key  #=> :b
h.sample_key! #=> :d
```

**Sample Value:**
`sample_value` returns a random value.
`sample_value!` delete a random key-value pair, returning the value.

```ruby
h = { a: 1, b: 2, c: 3, d: 4 }

h.sample_value  #=> 1
h.sample_value! #=> 3
```

**Shuffle:**
`shuffle` returns a copy of the hash with values arranged in new random order.
`shuffle!` returns the hash with values arranged in new random order.

```ruby
h = { a: 1, b: 2, c: 3, d: 4 }

h.shuffle  #=> { b: 2, c: 3, a: 1, d: 4 }
h.shuffle! #=> { d: 4, b: 2, c: 3, a: 1 }
```

**Slice:**
`slice` returns a hash to include only the given keys. Returns a hash containing the given keys.
`slice!` replaces the hash with only the given keys. Returns a hash containing the removed key/value pairs.

```ruby
h = { a: 1, b: 2, c: 3, d: 4 }

h.slice(:a, :b)  #=> { a: 1, b: 2 }
h.slice!(:a, :b) #=> { c: 3, d: 4 }
```

**Stringify Keys:**
`stringify_keys` and `stringify_keys!` converts the hash keys to strings.

```ruby
{ foo: 'foo', 'bar' => 'bar' }.stringify_keys #=> { 'foo' => 'foo', 'baz' => 'baz' }
```

**Strip:**
`strip` and `strip!` returns a hash with non nil, false, or blank values.

```ruby
{}.strip                                                      #=> {}
{ foo: nil, baz: false, boo: '', faz: ' ' }.strip             #=> {}
{ foo: 'bar', baz: false, boo: nil, boz: '', faz: ' ' }.strip #=> { foo: 'bar' }
```

**Symbolize Keys:**
`symbolize_keys` and `symbolize_keys!` converts the hash keys to symbols.

```ruby
{ foo: 'foo', 'bar' => 'bar' }.symbolize_keys #=> { foo: 'foo', baz: 'baz' }
```

**Symbolize and Underscore Keys:**
`symbolize_and_underscore_keys` and `symbolize_and_underscore_keys!` symbolize and underscore hash keys.

```ruby
{ 'firstName' => 'foo', 'last Name' => 'test' }.symbolize_and_underscore_keys #=> { first_name: 'foo', last_name: 'test' }
```

**To Object:**
`to_o` converts an object to have an object like API.

```ruby
{ foo: { bar: true } }.to_o.foo.bar #=> true
```

**Transform Keys:**
`transform_keys` and `transform_keys!` returns a new hash with all keys converted using the block operation.

```ruby
{ foo: 'bar', baz: 'boo' }.transform_keys { |k| k.to_s.upcase } #=> { 'FOO' => 'bar', 'BAZ' => 'boo' }
```

**Transform Values:**
`transform_values` and `transform_values!` returns a new hash with all values converted using the block operation.

```ruby
{ foo: 'bar', baz: 'boo' }.transform_values { |v| v.to_s.upcase } #=> {foo: 'BAR', baz: 'BOO' }
```

**Vacant:**
`vacant?` returns where the value of a key is blank?.

```ruby
{}.vacant?(:foo)             #=> true
{ foo: ' ' }.vacant?(:foo)   #=> true
{ foo: 'bar' }.vacant?(:foo) #=> false
```
