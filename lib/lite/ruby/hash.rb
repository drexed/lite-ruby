# frozen_string_literal: true

class Hash

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

  def collect_keys
    collect { |key, _| yield(key) }
  end

  def collect_values
    collect { |_, val| yield(val) }
  end

  def deep_merge(other_hash, &block)
    dup.deep_merge!(other_hash, &block)
  end

  # rubocop:disable Metrics/MethodLength
  def deep_merge!(other_hash, &block)
    other_hash.each_pair do |current_key, other_value|
      this_value = self[current_key]

      self[current_key] = if this_value.is_a?(Hash) && other_value.is_a?(Hash)
                            this_value.deep_merge(other_value, yield(block))
                          elsif block_given? && key?(current_key)
                            yield(current_key, this_value, other_value)
                          else
                            other_value
                          end
    end

    self
  end
  # rubocop:enable Metrics/MethodLength

  def demote(key)
    dup.demote!(key)
  end

  def demote!(key)
    return self unless key?(key)

    merge!(key => delete(key))
  end

  def denillify(value = 0)
    dup.denillify!(value)
  end

  def denillify!(value = 0)
    each { |key, val| self[key] = val.nil? ? value : val }
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
                     .gsub(UNDERSCORE_LVL_1, '/')
                     .gsub(UNDERSCORE_LVL_2, '\1_\2')
                     .gsub(UNDERSCORE_LVL_3, '\1_\2')
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

  def vacant?(key)
    self[key].blank?
  end

  private

  UNDERSCORE_LVL_1 ||= /::/.freeze
  UNDERSCORE_LVL_2 ||= /([A-Z\d]+)([A-Z][a-z])/.freeze
  UNDERSCORE_LVL_3 ||= /([a-z\d])([A-Z])/.freeze

end
