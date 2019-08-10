# frozen_string_literal: true

class Hash

  class << self

    def zip(keys, values)
      keys.size.times.with_object({}) { |i, hash| hash[keys[i]] = values[i] }
    end

  end

  def alias(new_key, old_key)
    self[new_key] = self[old_key] if key?(old_key)
    self
  end

  def assert_valid_keys!(*valid_keys)
    each_key do |key|
      next if valid_keys.include?(key)

      raise ArgumentError,
            "Invalid key: #{key.inspect}." \
            "Allowed keys are: #{valid_keys.map(&:inspect).join(', ')}"
    end
  end

  def assert_all_valid_keys!(*valid_keys)
    return assert_valid_keys!(*valid_keys) unless empty?

    raise ArgumentError, 'An empty hash is not allowed'
  end

  def assert_valid_values!(*valid_values)
    each_value do |value|
      next if valid_values.include?(value)

      raise ArgumentError,
            "Invalid value: #{value.inspect}." \
            "Allowed values are: #{valid_values.map(&:inspect).join(', ')}"
    end
  end

  def assert_all_valid_values!(*valid_values)
    return assert_valid_values!(*valid_values) unless empty?

    raise ArgumentError, 'An empty hash is not allowed'
  end

  # rubocop:disable Style/GuardClause
  def bury(*args)
    if args.count < 2
      raise ArgumentError, '2 or more arguments required'
    elsif args.count == 2
      self[args[0]] = args[1]
    else
      arg = args.shift
      self[arg] = {} unless self[arg]
      self[arg].bury(*args) unless args.empty?
    end

    self
  end
  # rubocop:enable Style/GuardClause

  # rubocop:disable Metrics/MethodLength
  def collate(*others)
    hash = {}

    each_key { |key| hash[key] = [] }

    others.each do |other|
      other.each_key { |key| hash[key] = [] }
    end

    each { |key, val| hash[key] << val }

    others.each do |other|
      other.each { |key, val| hash[key] << val }
    end

    hash.each_value(&:flatten!)
    hash
  end
  # rubocop:enable Metrics/MethodLength

  def collate!(other_hash)
    replace(collate(other_hash))
  end

  def collect_keys
    collect { |key, _| yield(key) }
  end

  def collect_values
    collect { |_, val| yield(val) }
  end

  def dearray_values(idx = 0)
    each_with_object({}) do |(key, val), hash|
      hash[key] = case val
                  when Array then val[idx] || val[-1]
                  else val
                  end
    end
  end

  def dearray_values!(idx = 0)
    replace(dearray_values(idx))
  end

  def dearray_singular_values
    each_with_object({}) do |(key, val), hash|
      hash[key] = case val
                  when Array then val.size < 2 ? val[0] : val
                  else val
                  end
    end
  end

  def dearray_singular_values!
    replace(dearray_singular_values)
  end

  def deep_merge(other_hash, &block)
    dup.deep_merge!(other_hash, &block)
  end

  def deep_merge!(other_hash, &block)
    other_hash.each_pair.with_object(self) do |(current_key, other_value), hash|
      this_value = hash[current_key]

      hash[current_key] = if this_value.is_a?(Hash) && other_value.is_a?(Hash)
                            this_value.deep_merge(other_value, yield(block))
                          elsif block_given? && key?(current_key)
                            yield(current_key, this_value, other_value)
                          else
                            other_value
                          end
    end
  end

  def delete_unless
    delete_if { |key, val| !yield(key, val) }
  end

  def delete_values(*values)
    each_key.with_object([]) do |key, array|
      next unless values.include?(self[key])

      array << key
      delete(key)
    end
  end

  def demote(key)
    dup.demote!(key)
  end

  def demote!(key)
    return self unless key?(key)

    self[key] = delete(key)
    self
  end

  def denillify(identity = 0)
    dup.denillify!(identity)
  end

  def denillify!(identity = 0)
    each { |key, val| self[key] = val || identity }
  end

  def diff(hash)
    h1 = dup.delete_if { |k, v| hash[k] == v }
    h2 = hash.dup.delete_if { |k, _| key?(k) }
    h1.merge(h2)
  end

  def except(*keys)
    dup.except!(*keys)
  end

  def except!(*keys)
    keys.each_with_object(self) { |key, _| delete(key) }
  end

  def extract!(*keys)
    keys.each_with_object(self) { |key, hash| hash[key] = delete(key) if key?(key) }
  end

  def hmap(&block)
    dup.hmap!(&block)
  end

  def hmap!
    inject(self) { |hash, (key, val)| hash.merge(yield(key, val)) }
  end

  def insert(name, value)
    return false if key?(name)

    store(name, value)
    true
  end

  def invert
    each_pair.with_object({}) do |(key, val), hash|
      if val.is_a?(Array)
        val.each { |x| hash[x] = (hash.key?(x) ? [key, hash[x]].flatten : key) }
      else
        hash[val] = (hash.key?(val) ? [key, hash[val]].flatten : key)
      end
    end
  end

  def keys?(*check_keys)
    unknown_keys = check_keys - keys
    unknown_keys.empty?
  end

  alias has_keys? keys?

  def nillify
    dup.nillify!
  end

  def nillify!
    each do |key, val|
      self[key] = nil if !val.nil? && (val.try(:blank?) || val.try(:to_s).blank?)
    end
  end

  def only_fill(*keys, placeholder: nil)
    keys.each_with_object({}) { |key, hash| hash[key] = key?(key) ? self[key] : placeholder }
  end

  def only_fill!(*keys, placeholder: nil)
    replace(only_fill(*keys, placeholder: placeholder))
  end

  def only_keys?(*check_keys)
    unknown_keys = keys - check_keys
    unknown_keys.empty?
  end

  alias has_only_keys? only_keys?

  def pair?(key, value)
    self[key] == value
  end

  def promote(key)
    dup.promote!(key)
  end

  def promote!(key)
    return self unless key?(key)

    { key => delete(key) }.merge(self)
  end

  def rename_keys(*keys)
    dup.rename_keys!(*keys)
  end

  def rename_keys!(*keys)
    keys = Hash[*keys]
    keys.each_with_object(self) { |(key, val), hash| hash[val] = delete(key) if hash[key] }
  end

  def reverse_merge(other_hash)
    other_hash.merge(self)
  end

  def reverse_merge!(other_hash)
    other_hash.merge!(self)
  end

  def sample
    key = sample_key
    [key, fetch(key)]
  end

  def sample!
    key, value = sample
    delete(key)
    [key, value]
  end

  def sample_key
    hash_keys = keys
    hash_keys.at(Random.rand(hash_keys.size - 1))
  end

  def sample_key!
    key, = sample
    delete(key)
    key
  end

  def sample_value
    fetch(sample_key)
  end

  def sample_value!
    key, value = sample
    delete(key)
    value
  end

  def shuffle
    Hash[to_a.sample(size)]
  end

  def shuffle!
    replace(shuffle)
  end

  def slice!(*keys)
    replace(slice(*keys))
  end

  alias only slice
  alias only! slice!

  def stringify_keys
    each_with_object({}) { |(key, val), hash| hash[key.to_s] = val }
  end

  def stringify_keys!
    replace(stringify_keys)
  end

  def strip
    select { |_, val| !val.blank? }
  end

  def strip!
    reject! { |_, val| val.blank? }
  end

  def symbolize_keys
    each_with_object({}) do |(key, val), hash|
      new_key = begin
                  key.to_s.to_sym
                rescue StandardError
                  key
                end

      hash[new_key] = val
    end
  end

  def symbolize_keys!
    replace(symbolize_keys)
  end

  # rubocop:disable Metrics/MethodLength
  def symbolize_and_underscore_keys
    each_with_object({}) do |(key, val), hash|
      new_key = begin
                  key.to_s
                     .gsub(/::/, '/')
                     .gsub(/([A-Z\d]+)([A-Z][a-z])/, '\1_\2')
                     .gsub(/([a-z\d])([A-Z])/, '\1_\2')
                     .tr(' -', '_')
                     .downcase
                     .to_sym
                rescue StandardError
                  key
                end

      hash[new_key] = val
    end
  end
  # rubocop:enable Metrics/MethodLength

  def symbolize_and_underscore_keys!
    replace(symbolize_and_underscore_keys)
  end

  def to_object
    JSON.parse(to_json, object_class: OpenStruct)
  end

  alias to_o to_object

  def update_each
    replace(each_with_object({}) { |(key, val), hash| hash.update(yield(key, val)) })
  end

  def update_keys
    return to_enum(:update_keys) unless block_given?

    replace(each_with_object({}) { |(key, val), hash| hash[yield(key)] = val })
  end

  def update_values
    return to_enum(:update_values) unless block_given?

    replace(each_with_object({}) { |(key, val), hash| hash[key] = yield(val) })
  end

  def vacant?(key)
    self[key].blank?
  end

end
