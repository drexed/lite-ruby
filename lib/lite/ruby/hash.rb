# frozen_string_literal: true

if Lite::Ruby.configuration.monkey_patches.include?('hash')
  class Hash

    class << self

      def zip(keys, values)
        keys.size.times.with_object({}) { |i, hash| hash[keys[i]] = values[i] }
      end

    end

    def aka(new_key, old_key)
      self[new_key] = self[old_key] if key?(old_key)
      self
    end

    def assert_min_keys!(*valid_keys)
      return self if empty?

      valid_keys.each do |key|
        next if key?(key)

        raise ArgumentError,
              "Missing key: #{key.inspect}. " \
              "Minimum keys are: #{valid_keys.map(&:inspect).join(', ')}"
      end

      self
    end

    def assert_all_min_keys!(*valid_keys)
      return assert_min_keys!(*valid_keys) unless empty?

      raise ArgumentError, 'An empty hash is not allowed'
    end

    def assert_pair_presence!(*valid_keys)
      each do |key, value|
        if !valid_keys.include?(key)
          raise ArgumentError,
                "Invalid key: #{key.inspect}. " \
                "Allowed keys are: #{valid_keys.map(&:inspect).join(', ')}"
        elsif value.respond_to?(:blank?) ? value.blank? : !value
          raise ArgumentError, "A #{value.inspect} value for #{key.inspect} is not allowed"
        end
      end
    end

    def assert_all_pair_presence!(*valid_keys)
      return assert_pair_presence!(*valid_keys) unless empty?

      raise ArgumentError, 'An empty hash is not allowed'
    end

    def assert_valid_keys!(*valid_keys)
      each_key do |key|
        next if valid_keys.include?(key)

        raise ArgumentError,
              "Invalid key: #{key.inspect}. " \
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
              "Invalid value: #{value.inspect}. " \
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

    # rubocop:disable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/MethodLength
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
    # rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/MethodLength

    def collate!(other_hash)
      replace(collate(other_hash))
    end

    def collect_keys(&block)
      keys.map(&block)
    end

    def collect_values(&block)
      values.map(&block)
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

    # rubocop:disable Style/CaseEquality
    def deep_dup
      hash = dup

      each_pair do |key, value|
        if key.frozen? && ::String === key
          hash[key] = value.deep_dup
        else
          hash.delete(key)
          hash[key.deep_dup] = value.deep_dup
        end
      end

      hash
    end
    # rubocop:enable Style/CaseEquality

    def deep_merge(other_hash, &block)
      dup.deep_merge!(other_hash, &block)
    end

    def deep_merge!(other_hash, &block)
      merge!(other_hash) do |key, this_val, other_val|
        if this_val.is_a?(Hash) && other_val.is_a?(Hash)
          this_val.deep_merge(other_val, &block)
        elsif defined?(yield)
          yield(key, this_val, other_val)
        else
          other_val
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
      replace(reverse_merge(other_hash))
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
      omit = slice(*self.keys - keys)
      hash = slice(*keys)
      hash.default = default
      hash.default_proc = default_proc if default_proc
      replace(hash)
      omit
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

    def to_open_struct(lazy: true)
      struct = OpenStruct.new(self)
      struct.methods(lazy)
      struct
    end

    def to_struct
      struct = Struct.new(*keys)
      struct.new(*values)
    end

    def update_each
      replace(each_with_object({}) { |(key, val), hash| hash.update(yield(key, val)) })
    end

    def update_keys
      return to_enum(:update_keys) unless defined?(yield)

      replace(each_with_object({}) { |(key, val), hash| hash[yield(key)] = val })
    end

    def update_values
      return to_enum(:update_values) unless defined?(yield)

      replace(each_with_object({}) { |(key, val), hash| hash[key] = yield(val) })
    end

    def vacant?(key)
      value = self[key]
      respond_to?(:blank?) ? value.blank? : !value
    end

  end
end
