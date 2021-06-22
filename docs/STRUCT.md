# Struct

`[]`
------
Access a value in the Struct by key, like a Hash.

```ruby
person = Struct.new(:name, :age)
person.new('bob', 60)

person['name'] #=> 'bob'
person['fake'] #=> nil
```

`[]=`
------
Store a value in the Struct by key, like a Hash.

```ruby
person = Struct.new(:name, :age)
person.new('bob', 60)

person['name'] = 'tim'

person['name'] #=> 'tim'
```

`attributes`
------
Returns the key values of the assigned struct.

```ruby
person = Struct.new(:name, :age)
person.new('bob', 60)

person.attributes #=> { name: 'bob', age: 60 }
```

`replace`
------
Replaces values provided within the hash.

```ruby
person = Struct.new(:name, :age)
person.new('bob', 60)

person.replace(name: 'tom', age: 28)
preson.name #=> 'tom'
```
