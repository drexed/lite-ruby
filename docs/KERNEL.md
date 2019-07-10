# Kernel

`caller_name`
------
Returns the name of the method calling it.

```ruby
def sample_key
  caller_name(0)
end

sample_key #=> 'sample_key'
```

`safe_eval`
------
Try's to evaluate or returns self.

```ruby
'[1,2,3]'.safe_eval  #=> [1,2,3]
'[#1,2,3]'.safe_eval #=> '[#1,2,3]'
```

`try_eval`
------
Try's to evaluate or returns nil.

```ruby
'[1,2,3]'.try_eval  #=> [1,2,3]
'[#1,2,3]'.try_eval #=> nil
```
