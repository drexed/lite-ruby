# OpenStruct

`Initialize`
Allows the initialization of an OpenStruct with a setter block.

```ruby
OpenStruct.new(name: 'bob', age: 60) do |o|
  o.gender = :M
end
```

`[]`
------
Access a value in the OpenStruct by key, like a Hash.

```ruby
person = OpenStruct.new(name: 'bob', age: 60)

person['name'] #=> 'bob'
```

`[]=`
------
Store a value in the OpenStruct by key, like a Hash.

```ruby
person = OpenStruct.new(name: 'bob', age: 60)

person['name'] = 'tim'
```

`attributes`
------
Returns the key values of the assigned struct.

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
