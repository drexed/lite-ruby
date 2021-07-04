# frozen_string_literal: true

if Lite::Ruby.configuration.monkey_patches.include?('array')
  class Array

    def assert_min_values!(*valid_values)
      return self if empty?

      valid_values.each do |value|
        next if include?(value)

        raise ArgumentError,
              "Missing value: #{value.inspect}. " \
              "Minimum values are: #{valid_values.map(&:inspect).join(', ')}"
      end

      self
    end

    def assert_all_min_values!(*valid_values)
      return assert_min_values!(*valid_values) unless empty?

      raise ArgumentError, 'An empty array is not allowed'
    end

    def assert_valid_values!(*valid_values)
      each do |value|
        next if valid_values.include?(value)

        raise ArgumentError,
              "Invalid value: #{value.inspect}. " \
              "Allowed values are: #{valid_values.map(&:inspect).join(', ')}"
      end
    end

    def assert_all_valid_values!(*valid_values)
      return assert_valid_values!(*valid_values) unless empty?

      raise ArgumentError, 'An empty array is not allowed'
    end

    def assert_value_presence!
      each do |value|
        next if value.respond_to?(:present?) ? value.present? : value

        raise ArgumentError, "A #{value.inspect} value is not allowed"
      end
    end

    def assert_all_value_presence!
      return assert_value_presence! unless empty?

      raise ArgumentError, 'An empty array is not allowed'
    end

    def after(value)
      return unless include?(value)

      self[(index(value) + 1) % size]
    end

    def all_after(value)
      return unless include?(value)

      i = index(value)
      return if i == (size - 1)

      self[(i + 1)..-1]
    end

    def all_before(value)
      return unless include?(value)

      i = index(value)
      return if i.zero?

      self[0..(i - 1)]
    end

    def before(value)
      return unless include?(value)

      self[(index(value) - 1) % size]
    end

    # rubocop:disable Metrics/AbcSize, Metrics/BlockNesting, Metrics/MethodLength
    # rubocop:disable Metrics/PerceivedComplexity, Style/GuardClause, Style/IfInsideElse
    def bury(*args)
      if args.count < 2
        raise ArgumentError, '2 or more arguments required'
      elsif args.count == 2
        if args[0].is_a?(Integer)
          self[args[0]] = args[1]
        else
          self << { args[0] => args[1] }
        end
      else
        if args[0].is_a?(Integer)
          arg = args.shift
          self[arg] = [] unless self[arg]
          self[arg].bury(*args)
        else
          self << {}.bury(*args)
        end
      end

      self
    end
    # rubocop:enable Metrics/PerceivedComplexity, Style/GuardClause, Style/IfInsideElse
    # rubocop:enable Metrics/AbcSize, Metrics/BlockNesting, Metrics/MethodLength

    def contains_all?(other)
      (other & self) == self
    end

    def contains_any?(other)
      !contains_none?(other)
    end

    def contains_none?(other)
      (other & self).empty?
    end

    def delete_first
      self[1..-1]
    end

    def delete_first!
      replace(delete_first)
    end

    def delete_last
      self[0...-1]
    end

    def delete_last!
      replace(delete_last)
    end

    def delete_values(*args)
      args.each_with_object([]) { |val, array| array << delete(val) }
    end

    def demote(value)
      sort_by { |val| val == value ? 0 : -1 }
    end

    def demote!(value)
      replace(demote(value))
    end

    def denillify(identity = 0)
      map { |val| val || identity }
    end

    def denillify!(identity = 0)
      replace(denillify(identity))
    end

    def divergence(other)
      (self - other) | (other - self)
    end

    def duplicates(minimum = 2)
      hash = Hash.new(0)
      each { |val| hash[val] += 1 }
      hash.delete_if { |_, val| val < minimum }.keys
    end

    def except(*values)
      reject { |val| values.include?(val) }
    end

    def except!(*values)
      reject! { |val| values.include?(val) }
      self
    end

    def fulfill(value, amount)
      return self if amount <= size

      fill(value, size..(amount - 1))
    end

    def groups(number)
      return [] if number <= 0

      num, rem = size.divmod(number)
      collection = (0..(num - 1)).collect { |val| self[(val * number), number] }
      return collection unless rem.positive?

      collection << self[-rem, rem]
    end

    def indexes(value)
      array = []
      each_with_index { |val, i| array << i if value == val }
      array
    end

    def match(value)
      find { |val| value == val }
    end

    def merge(*values)
      dup.merge!(*values)
    end

    def merge!(*values)
      values.each_with_object(self) { |val, arr| arr.concat(val) }
    end

    def nillify
      map { |val| !val.nil? && (val.try(:blank?) || val.try(:to_s).blank?) ? nil : val }
    end

    def nillify!
      replace(nillify)
    end

    def only(*values)
      select { |val| values.include?(val) }
    end

    def only!(*values)
      select! { |val| values.include?(val) }
      self
    end

    def position(value)
      idx = index(value)
      return idx if idx.nil?

      idx + 1
    end

    def positions(value)
      indexes(value).map { |val| val + 1 }
    end

    def probability
      hash = Hash.new(0.0)
      differ = 0.0

      each do |val|
        hash[val] += 1.0
        differ += 1.0
      end

      hash.each_key { |val| hash[val] /= differ }
      hash
    end

    def promote(value)
      sort_by { |val| val == value ? -1 : 0 }
    end

    def promote!(value)
      sort_by! { |val| val == value ? -1 : 0 }
    end

    def rand_sample(max = nil)
      amount = rand(1..(max || size))
      sample(amount)
    end

    def rposition(value)
      idx = rindex(value)
      return idx if idx.nil?

      idx + 1
    end

    def sample!
      delete_at(Random.rand(size - 1))
    end

    def strip
      reject(&:blank?)
    end

    def strip!
      reject!(&:blank?)
      self
    end

    def swap(from, to)
      self[from], self[to] = self[to], self[from]
      self
    end

    alias indices indexes
    alias reject_values except
    alias reject_values! except!
    alias select_values only
    alias select_values! only!

  end

  require 'lite/ruby/safe/array' unless defined?(ActiveSupport)
end
