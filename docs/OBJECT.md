# Object

`array?`
------
Returns if an object is an array.

```ruby
[].array?     #=> true
'test'.array? #=> false
```

`blank?`
------
Returns if an object is empty or nil.

```ruby
''.blank?     #=> true
'test'.blank? #=> false
```

`bool?`
------
Returns if an object is a `true` or `false` class.

```ruby
true.bool?    #=> true
1.bool?       #=> false
'false'.bool? #=> false
```

`boolean?`
------
Returns if an object is an boolean.

```ruby
true.boolean?    #=> true
1.boolean?       #=> true
'false'.boolean? #=> true
'foo'.boolean?   #=> false
```

`date?`
------
Returns if an object is a `date`.

```ruby
Date.today.date? #=> true
'foo'.date?      #=> false
```

`false?`
------
Returns if an object is `false`.

```ruby
false.false? #=> true
true.false?  #=> false
```

`falsey?`
------
Returns if an object is `false`, `nil`, or `0`.

```ruby
false.falsey? #=> true
true.falsey?  #=> false
0.falsey?     #=> true
```

`float?`
------
Returns if an object is a `float`.

```ruby
1.0.float? #=> true
1.float?   #=> false
```

`hash?`
------
Returns if an object is a `hash`.

```ruby
{}.hash? #=> true
[].hash? #=> false
```

`integer?`
------
Returns if an object is a `integer`.

```ruby
1.integer?   #=> true
1.0.integer? #=> false
```

`numeric?`
------
Returns if an object is `numeric`.

```ruby
1.numeric?     #=> true
1.0.numeric?   #=> true
'1.0'.numeric? #=> false
```

`numeral?`
------
Returns if an object's string value is `numeric`.

```ruby
'-32.50'.numeral? #=> true
'$2.55'.numeral?  #=> false
```

`palindrome?`
------
Returns if an object is equal when reversed.

```ruby
'racecar'.palindrome? #=> true
'example'.palindrome? #=> false
12321.palindrome?     #=> true
12345.palindrome?     #=> false
```

`present?`
------
Returns if an object is not empty or `nil`.

```ruby
'test'.present? #=> true
''.present?     #=> false
```

`range?`
------
Returns if an object is a `range`.

```ruby
(1..2).range? #=> true
1.range?      #=> false
```

`safe_call`
------
Executes the caller to an object and rescues with self.

```ruby
callr = ->(x) { 3 * x }

3.safe_call        #=> 3
callr.safe_call(3) #=> 9
callr.safe_call    #=> raises ArgumentError: wrong number of arguments
```

`safe_send`
------
Executes the object method and rescues with self.

```ruby
3.safe_send(:fake) #=> 3
3.safe_send(:to_s) #=> '3'
3.safe_send(:+, 2) #=> 5
```

`safe_try`
------
Similar to the try method but returns self instead of `nil`.

```ruby
'example'.safe_try(:upcase)      #=> 'EXAMPLE'
'example'.safe_try(:fake_method) #=> 'example'
```

`salvage`
------
Returns a placeholder if object is blank?.

```ruby
' '.salvage        #=> '---'
nil.salvage('bar') #=> 'bar'
123.salvage        #=> 123
```

`send_chain`
------
Chains multiple callers to an object.

```ruby
3.send_chain(:factorial)            #=> 6
3.send_chain([:add, 4])             #=> 7
3.send_chain(:factorial, [:add, 4]) #=> 10
```

`send_chain_if`
------
Chains multiple callers to an object if it responds to the result.

```ruby
3.send_chain_if(:test)                        #=> 3
3.send_chain_if(:factorial)                   #=> 6
3.send_chain_if([:add, 4])                    #=> 7
3.send_chain_if(:factorial, [:add, 4], :test) #=> 10
```

`send_if`
------
Sends a caller to an object if it responds to it.

```ruby
3.send_if(:test)      #=> 3
3.send_if(:factorial) #=> 6
3.send_if(:add, 4)    #=> 7
```

`string?`
------
Returns if an object is a `string`.

```ruby
'foo'.string? #=> true
1.string?     #=> false
```

`symbol?`
------
Returns if an object is a `symbol`.

```ruby
:foo.time?  #=> true
'foo'.time? #=> false
```

`time?`
------
Returns if an object is a `time`.

```ruby
Time.now.time? #=> true
'foo'.time?    #=> false
```

`true?`
------
Returns if an object is `true`.

```ruby
true.true?  #=> true
false.true? #=> false
```

`truthy?`
------
Returns if an object is `true` or `1`.

```ruby
true.truthy?  #=> true
false.truthy? #=> false
1.truthy?     #=> true
```

`try(!)`
------
Invokes the public method whose name goes as first argument just like public_send does, except that
if the receiver does not respond to it the call returns nil rather than raising an exception.

```ruby
'example'.try(:upcase)      #=> 'EXAMPLE'
'example'.try(:fake_method) #=> nil
```

`try_call`
------
Executes the caller to an object and rescues with `nil`.

```ruby
callr = ->(x) { 3 * x }

3.try_call        #=> nil
callr.try_call(3) #=> 9
callr.try_call    #=> raises ArgumentError: wrong number of arguments
```

`try_send`
------
Executes the object method and rescues with `nil`.

```ruby
3.try_send(:fake) #=> 3
3.try_send(:to_s) #=> '3'
3.try_send(:+, 2) #=> 5
```
