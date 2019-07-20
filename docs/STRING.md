# String

`acronym(!)`
------
Returns the first letter of each word without spaces.

```ruby
'example string'.acronym #=> 'es'
```

`any?`
------
Returns if a string includes a set of string(s).

```ruby
'example string'.any?('foo')           #=> false
'example string'.any?('foo', 'string') #=> true
```

`ascii_only(!)`
------
Replace non-ascii characters.

```ruby
'中文123'.ascii_only       #=> '123'
'中文123'.ascii_only!('x') #=> 'xx123'
```

`at`
------
Returns the characters at index position, matching string, or regex.

```ruby
'example_string'.at(0)     #=> 'e'
'example_string'.at(-2)    #=> 'n'
'example_string'.at(1..3)  #=> 'xam'
'example_string'.at('e_s') #=> 'e_s'
'example_string'.at(/ple/) #=> 'ple'
'example_string'.at(99)    #=> nil
```

`camelize(!)` aka `camelcase(!)`
------
Transforms a string to camelcase.

```ruby
'example_string'.camelize         #=> 'ExampleString'
'example_String'.camecase         #=> 'ExampleString'
'example_string'.camelize(:lower) #=> 'exampleString'
'example_String'.camecase(:lower) #=> 'exampleString'
```

`capitalized?`
------
Returns true if the first character is capitalized.

```ruby
'Example string'.capitalized? #=> true
'EXAMPLE STRING'.capitalized? #=> false
'example string'.capitalized? #=> false
'Example String'.capitalized? #=> false
```

`classify(!)`
------
Transforms a string to a class name like Rails does for table names to models.

```ruby
'example_string'.classify      #=> 'ExampleString'
'example_string/test'.classify #=> 'ExampleString::Test'
'example_string.test'.classify #=> 'Test'
```

`constantize`
------
Converts a string in an object.

```ruby
'Example::String'.constantize #=> Class Object
```

`dasherize(!)`
------
Replaces underscores with dashes in the string.

```ruby
'example_string'.dasherize #=> 'example-string'
```

`deconstantize(!)`
------
Removes the rightmost segment from the constant expression in the string.

```ruby
'Example::String'.deconstantize   # => 'Example'
'::Example::String'.deconstantize # => '::Example'
'String'.deconstantize            # => ''
'::String'.deconstantize          # => ''
''.deconstantize                  # => ''
```

`demodulize(!)`
------
Removes the module part from the expression in the string.

```ruby
'Example::String'.demodulize #=> 'String'
'String'.demodulize          #=> 'String'
```

`domain`
------
Extracts the domain name from a URL.

```ruby
'http://www.example.com/fake-page'.domain #=> 'www.example.com'
'example string'.domain                   #=> 'example string'
```

`downcase?`
------
Returns true if all characters are lowercase.

```ruby
'example'.downcase? #=> true
'Example'.downcase? #=> false
'EXAMPLE'.downcase? #=> false
```

`each_word`
------
Splits a string into multiple words and yields its enumeration.

```ruby
'abc. 123'.each_word(&:campitalize!) #=> ['Abc.', '123']
```

`encode_only(!)`
------
Replace non-encode characters.

```ruby
'中文123'.encode_only('UTF-8')       #=> '123'
'中文123'.encode_only!('ASCII', 'x') #=> 'xx123'
```

`ellipsize`
------
Truncate a string in the middle.

Option | Type | Default
--- | --- | ---
offset | integer | 4
separator | string | ' '

```ruby
'0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ'.ellipsize(30)                   #=> '0123...WXYZ'
'0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ'.ellipsize(50)                   #=> '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ'
'0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ'.ellipsize(30, offset: 2)        #=> '01...YZ'
'0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ'.ellipsize(30, separator: '+++') #=> '0123+++WXYZ'
```

`first`
------
Returns the first character. If a limit is supplied, Returns a substring from the beginning of the
string until it reaches the limit value. If the given limit is greater than or equal to the string
length, Returns a copy of self.

```ruby
'example'.first    #=> 'e'
'example'.first(0) #=> ''
'example'.first(3) #=> 'exa'
```

`format`
------
Returns an interpolated string that allows for options.

```ruby
'example %s'.format('string')                              #=> 'example string'
'test %{one} %{two}'.format(one: 'example', two: 'string') #=> 'test example string'
'%d + %d'.format([1, 2])                                   #=> '1 + 2'
```

`from`
------
Returns a substring from the given position to the end of the string. If the position is negative, it is counted from the end of the string.

```ruby
'example'.from(0) #=> 'example'
'example'.from(3) #=> 'mple'
```

`headerize(!)`
------
Capitalizes each word.

```ruby
' example test-sample '.headerize #=> 'Example Test-sample'
```

`humanize(!)`
------
Transforms a string to a human readable string.

Option | Type | Default
--- | --- | ---
capitalize | boolean | true

```ruby
'ExampleString'.humanize                     #=> 'Example string'
'_example_string_id'.humanize                #=> 'Example string'
'example_string'.humanize(capitalize: false) #=> 'example string'
```

`indent(!)`
------
Indents the lines in the receiver.

```ruby
'example'.indent(2)       #=> '  example'
'example'.indent(2, '\t') #=> '\t\texample'
```

`index_all`
------
Returns the index values of matching patterns.

```ruby
'012324507654301243'.index_all(0)                           #=> [0,7,13]
'the apple is the best fruit in the world'.index_all('the') #=> [0,13,31]
'asdfasdfasdf'.index_all(/sd/)                              #=> [1,5,9]
```

`labelize(!)`
------
Transforms a string to a human readable string.

```ruby
'example string'.labelize     #=> 'Example string'
'_example_string_id'.labelize #=> 'Example string ID'
'ExampleString'.labelize      #=> 'Example string'
```

`last`
------
Returns the last character of the string. If a limit is supplied, Returns a substring from the end
of the string until it reaches the limit value (counting backwards). If the given limit is greater
than or equal to the string length, Returns a copy of self.

```ruby
'example'.last     #=> 'e'
'example'.last(0)  #=> ''
'example'.first(3) #=> 'ple'
```

`mixcase?`
------
Returns true if characters are mixedcase.

```ruby
'Example'.mixedcase? #=> true
'EXAMPLE'.mixedcase? #=> false
'example'.mixedcase? #=> false
```

`ordinal`
------
Returns the suffix that should be added to a number to denote the position in an ordered sequence such as 1st, 2nd, 3rd, 4th.

```ruby
'1'.ordinal  #=> 'th'
'2'.ordinal  #=> 'nd'
'3'.ordinal  #=> 'rd'
'11'.ordinal #=> 'th'
```

`ordinalize`
------
Transforms a number into an ordinal string used to denote the position in an ordered sequence such as 1st, 2nd, 3rd, 4th.

```ruby
'1'.ordinalize  #=> '1th'
'2'.ordinalize  #=> '2nd'
'3'.ordinalize  #=> '3rd'
'11'.ordinalize #=> '4th'
```

`parameterize(!)`
------
Makes a string suitable for a dashed url parameter string.

```ruby
'example_string'.parameterize                 #=> 'example-string'
'example_string'.parameterize(separator: '?') #=> 'example?string'
```

`pollute(!)`
------
Pollutes the space between every letter in a string, so it will be exempt from any impending string searches.

```ruby
'test'.pollute      #=> 't^--^--^e^--^--^s^--^--^t^--^--^'
'test'.pollute('-') #=> 't-e-s-t-'
```

`pop`
------
Returns the last character of a string.

```ruby
'test'.pop #=> 't'
```

`push`
------
Concats string to self.

```ruby
'test'.push('er') #=> 'tester'
```

`remove(!)`
------
Removes every instance of a string.

```ruby
'this thing that thing'.remove('thing')        #=> 'this  that '
'this thing that thing'.remove(1..3)           #=> 't thing that thing'
'this thing that them'.remove('thing', 'them') #=> 'this  that '
'this thing that them'.remove('thing', 1..3)   #=> 't  that them'
```

`remove_tags(!)`
------
Removes HTML tags from a string.

```ruby
'example'.remove_tags                                   #=> 'example'
'<a href='http://example.com'>click</a>'.remove_tags    #=> 'click'
'this is <b>bold</b> and <em>emphatic</em>'.remove_tags #=> 'this is bold and emphatic'
```

`sample(!)`
------
Removes a random value and returns that value.

```ruby
'this thing that'.sample            #=> 'thing'
'this thing that'.sample(' thing ') #=> 'that'
```

`shift(!)`
------
Removes the first instance of a string.

```ruby
'this thing that thing'.shift                 #=> 't'
'this thing that thing'.shift('thing')        #=> 'this  that thing'
'this thing that thing'.shift('this', 'that') #=> ' thing  thing'
```

`shuffle(!)`
------
Randomizes the characters in a string.

```ruby
'ruby rules'.sample  #=> 'e lybrsuur'
'ruby rules'.sample! #=> 'rblse syru'
```

`sift(!)`
------
Returns a string matching any character in a pattern.

```ruby
'qa2ws3ed4rf5tg6yh7uj8ik9ol'.sift('0123456789')          #=> '23456789'
'qa2ws3ed4rf5tg6yh7uj8ik9ol'.sift(0..9)                  #=> '23456789'
'qa2ws3ed4rf5tg6yh7uj8ik9ol'.sift([0,1,2,3,4,5,6,7,8,9]) #=> '23456789'
```

`slugify(!)`
------
Returns a permalink-style string, with odd characters removed.

```ruby
'example'.slugify                  #=> 'example'
'example string'.slugify           #=> 'example-string'
'Example string @@@ test!'.slugify #=> 'example-string-test'
```

`sort(!)`
------
Returns a sorted a string.

```ruby
'adbec'.sort #=> 'abcde'
```

`squish(!)`
------
Returns the string, first removing all whitespace on both ends of the string, and then changing
remaining consecutive whitespace groups into one space each.

```ruby
'example    string'.squish        #=> 'example string'
'example  \n   \t  string'.squish #=> 'example string'
'   example    string   '.squish  #=> 'example string'
```

`titleize(!)`
------
Capitalizes each word in a string.

```ruby
'example string'.titleize     #=> 'Example String'
'_example_string_id'.titleize #=> 'Example String'
'ExampleString'.titleize      #=> 'Example String'
```

`to`
------
Returns a substring from the beginning of the string to the given position.
If the position is negative, it is counted from the end of the string.

```ruby
'example'.to(0)  #=> 'example'
'example'.to(3)  #=> 'exam'
'example'.to(-2) #=> 'exampl'
```

`transliterize(!)`
------
Returns a string with swapped special characters.

```ruby
'źåöé'.transliterize #=> 'zaoe'
```

`truncate`
------
Retuns a trimmed string after a given length if string is longer than length.

Option | Type | Default
--- | --- | ---
omission | string | '...'
separator | string | ' '

```ruby
'example string'.truncate(3)                          #=> '...'
'example string'.truncate(6)                          #=> 'exa...'
'example string'.truncate(12, separator: ' ')         #=> 'example...'
'example string'.truncate(13, omission: '... (more)') #=> 'exa... (more)'
'example string'.truncate(15)                         #=> 'example string'
```

`truncate_words`
------
Truncates a given text after a given number of words.

Option | Type | Default
--- | --- | ---
omission | string | '...'
separator | string | ' '

```ruby
'example string test'.truncate_words(1)                                                                #=> 'example...'
'Once<br>upon<br>a<br>time<br>in<br>a<br>world'.truncate_words(5, separator: '<br>')                   #=> 'Once<br>upon<br>a<br>time<br>in...'
'And they found that many people were sleeping better.'.truncate_words(5, omission: '... (continued)') #=> 'And they found that many... (continued)'
```

`underscore(!)`
------
Transforms a string to snake case.

```ruby
'ExampleString'.underscore       #=> 'example_string'
'exampleString'.underscore       #=> 'example_string'
'ExampleString::Test'.underscore #=> 'example_string/test'
```

`unpollute(!)`
------
Removes the default or custom pollution character. Can also be used to remove an unwanted character.

```ruby
't^--^--^e^--^--^s^--^--^t^--^--^'.unpollute #=> 'test'
't-e-s-t-'.unpollute                         #=> 'test'
```

`upcase?`
------
Returns true if all characters are uppercase.

```ruby
'EXAMPLE'.upcase? #=> true
'example'.upcase? #=> false
'Example'.upcase? #=> false
```

`unshift(!)`
------
Prepends string(s) to self.

```ruby
'this thing that thing'.unshift('thing ')         #=> 'thing this thing that thing'
'this thing that thing'.unshift('this ', 'that ') #=> 'this that this thing that thing'
```

`words`
------
Splits a string into multiple words split by spaces.

```ruby
'abc. 123'.words #=> ['abc.', '123']
```

`words_without_punctuation`
------
Splits a string into multiple words without punctuation split by spaces.

```ruby
'Slowly, grudgingly he said: "This has to stop."'.words_without_punctuation #=> ['Slowly', 'grudgingly', 'he', 'said', 'This', 'has', 'to', 'stop']
```
