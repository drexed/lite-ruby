# OpenStruct

`Initialize`
Allows the initialization of an OpenStruct with a setter block.

```ruby
OpenStruct.new(name: 'bob', age: 60) do |o|
  o.gender = :M
end
```

`attributes`
------
Returns the key values as a hash of the assigned struct.

```ruby
person = OpenStruct.new(name: 'bob', age: 60)

person.attributes #=> { name: 'bob', age: 60 }
```

`replace`
------
Replaces values provided within the hash.

```ruby
person = OpenStruct.new(name: 'bob', age: 60)

person.replace(name: 'tom', age: 28)
preson.name #=> 'tom'
```

`to_hash` aka `to_h`
------
Returns the key values as a hash of the assigned struct.

```ruby
person = OpenStruct.new(name: 'bob', age: 60)

person.to_hash               #=> { table: { name: 'bob', age: 60 } }
person.to_hash(table: false) #=> { name: 'bob', age: 60 }
```

`to_json` aka `as_json`
------
Returns the key values as Json of the assigned struct.

```ruby
person = OpenStruct.new(name: 'bob', age: 60)

person.to_json               #=> { table: { name: 'bob', age: 60 } }
person.to_json(table: false) #=> { name: 'bob', age: 60 }
```
