class Hash

  def assert_valid_keys(*valid_keys)
    each_key do |key|
      next if valid_keys.include?(key)

      raise ArgumentError,
            "Unknown key: #{key.inspect}. Valid keys are: #{valid_keys.map(&:inspect).join(', ')}"
    end
  end unless defined?(assert_valid_keys)

  def assert_valid_keys!(*valid_keys)
    return assert_valid_keys(*valid_keys) unless empty?

    raise ArgumentError,
            "Empty hash. Valid keys are: #{valid_keys.map(&:inspect).join(', ')}"
  end unless defined?(assert_valid_keys!)

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
  end unless defined?(bury)
  # rubocop:enable Style/GuardClause

  def compact
    select { |_, val| !val.nil? }
  end unless defined?(compact)

  def compact!
    reject! { |_, val| val.nil? }
  end unless defined?(compact!)

  # rubocop:disable Lint/UnusedMethodArgument
  def collect_keys(&block)
    return enum_for(:collect_keys) unless block_given?

    collect { |key, _| yield(key) }
  end unless defined?(collect_keys)

  def collect_values(&block)
    return enum_for(:collect_values) unless block_given?

    collect { |_, val| yield(val) }
  end unless defined?(collect_values)
  # rubocop:enable Lint/UnusedMethodArgument

  def deep_merge(other_hash, &block)
    dup.deep_merge!(other_hash, &block)
  end unless defined?(deep_merge)

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
  end unless defined?(deep_merge!)
  # rubocop:enable Metrics/MethodLength

  def demote(key)
    dup.demote!(key)
  end unless defined?(demote)

  def demote!(key)
    return self unless key?(key)

    merge!(key => delete(key))
  end unless defined?(demote!)

  def denillify(value = 0)
    dup.denillify!(value)
  end unless defined?(denillify)

  def denillify!(value = 0)
    each { |key, val| self[key] = val.nil? ? value : val }
  end unless defined?(denillify!)

  def dig(key, *rest)
    value = (self[key] rescue nil)

    return value if value.nil? || rest.empty? || !value.respond_to?(:dig)

    value.dig(*rest)
  end unless defined?(dig)

  def except(*keys)
    dup.except!(*keys)
  end unless defined?(except)

  def except!(*keys)
    keys.each_with_object(self) { |key, _| delete(key) }
  end unless defined?(except!)

  def extract!(*keys)
    keys.each_with_object(self) { |key, hash| hash[key] = delete(key) if key?(key) }
  end unless defined?(extract!)

  def hmap(&block)
    dup.hmap!(&block)
  end unless defined?(hmap)

  # rubocop:disable Lint/UnusedMethodArgument
  def hmap!(&block)
    inject(self) { |hash, (key, val)| hash.merge(yield(key, val)) }
  end unless defined?(hmap!)
  # rubocop:enable Lint/UnusedMethodArgument

  def nillify
    dup.nillify!
  end unless defined?(nillify)

  def nillify!
    each do |key, val|
      self[key] = nil if !val.nil? && (val.try(:blank?) || val.try(:to_s).blank?)
    end
  end unless defined?(nillify!)

  def only(*keys)
    dup.only!(*keys)
  end unless defined?(only)

  def only!(*keys)
    hash = {}
    keys.each { |key| hash[key] = self[key] if key?(key) }
    replace(hash)
  end unless defined?(only!)

  def only_fill(*keys, placeholder: nil)
    keys.each_with_object({}) { |key, hash| hash[key] = key?(key) ? self[key] : placeholder }
  end unless defined?(only_fill)

  def only_fill!(*keys, placeholder: nil)
    replace(only_fill(*keys, placeholder: placeholder))
  end unless defined?(only_fill!)

  def pair?(key, value)
    self[key] == value
  end unless defined?(pair?)

  def promote(key)
    return self unless key?(key)

    { key => delete(key) }.merge(self)
  end unless defined?(promote)

  def promote!(key)
    replace(promote(key))
  end unless defined?(promote!)

  def rename_keys(*keys)
    dup.rename_keys!(*keys)
  end unless defined?(rename_keys)

  def rename_keys!(*keys)
    keys = Hash[*keys]
    keys.each_with_object(self) { |(key, val), hash| hash[val] = delete(key) if hash[key] }
  end unless defined?(rename_keys!)

  def reverse_merge(other_hash)
    other_hash.merge(self)
  end unless defined?(reverse_merge)

  def reverse_merge!(other_hash)
    replace(reverse_merge(other_hash))
  end unless defined?(reverse_merge!)

  def sample
    key = sample_key
    [key, fetch(key)]
  end unless defined?(sample)

  def sample!
    key, value = sample
    delete(key)
    [key, value]
  end unless defined?(sample!)

  def sample_key
    hash_keys = keys
    hash_keys.at(Random.rand(hash_keys.length - 1))
  end unless defined?(sample_key)

  def sample_key!
    key, _ = sample
    delete(key)
    key
  end unless defined?(sample_key!)

  def sample_value
    fetch(sample_key)
  end unless defined?(sample_value)

  def sample_value!
    key, value = sample
    delete(key)
    value
  end unless defined?(sample_value!)

  def shuffle
    Hash[to_a.sample(length)]
  end unless defined?(shuffle)

  def shuffle!
    replace(shuffle)
  end unless defined?(shuffle!)

  def slice(*keys)
    keys.each_with_object({}) { |key, hsh| hsh[key] = self[key] if key?(key) }
  end unless defined?(slice)

  def slice!(*keys)
    omit = slice(*self.keys - keys)
    hash = slice(*keys)

    hash.default = default
    hash.default_proc = default_proc if default_proc

    replace(hash)
    omit
  end unless defined?(slice!)

  def stringify_keys
    each_with_object({}) { |(key, val), hash| hash[key.to_s] = val }
  end unless defined?(stringify_keys)

  def stringify_keys!
    replace(stringify_keys)
  end unless defined?(stringify_keys!)

  def strip
    select { |_, val| !val.blank? }
  end unless defined?(strip)

  def strip!
    reject! { |_, val| val.blank? }
  end unless defined?(strip!)

  def symbolize_keys
    each_with_object({}) { |(key, val), hash| hash[(key.to_sym rescue key) || key] = val }
  end unless defined?(symbolize_keys)

  def symbolize_keys!
    replace(symbolize_keys)
  end unless defined?(symbolize_keys!)

  def symbolize_and_underscore_keys
    each_with_object({}) do |(key, val), hash|
      hash[(key.to_s.tr(' -', '_').underscore.to_sym rescue key) || key] = val
    end
  end unless defined?(symbolize_and_underscore_keys)

  def symbolize_and_underscore_keys!
    replace(symbolize_and_underscore_keys)
  end unless defined?(symbolize_and_underscore_keys!)

  def to_o
    JSON.parse(to_json, object_class: OpenStruct)
  end unless defined?(to_o)

  def transform_keys(&block)
    return enum_for(:transform_keys!) unless block_given?

    each_with_object({}) { |(key, val), hash| hash[yield(key)] = val }
  end unless defined?(transform_keys)

  # rubocop:disable Lint/UnusedMethodArgument
  def transform_keys!(&block)
    replace(transform_keys(&block))
  end unless defined?(transform_keys!)
  # rubocop:enable Lint/UnusedMethodArgument

  def transform_values(&block)
    return enum_for(:transform_values!) unless block_given?

    each_with_object({}) { |(key, val), hash| hash[key] = yield(val) }
  end unless defined?(transform_values)

  # rubocop:disable Lint/UnusedMethodArgument
  def transform_values!(&block)
    replace(transform_values(&block))
  end unless defined?(transform_values!)
  # rubocop:enable Lint/UnusedMethodArgument

  def vacant?(key)
    self[key].blank?
  end unless defined?(vacant?)

end
