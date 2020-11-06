# frozen_string_literal: true

class Hash

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

  def except(*keys)
    slice(*self.keys - keys)
  end

  def except!(*keys)
    keys.each { |key| delete(key) }
    self
  end

  def extract!(*keys)
    keys.each_with_object({}) { |key, hash| hash[key] = delete(key) if key?(key) }
  end

  def reverse_merge(other_hash)
    other_hash.merge(self)
  end

  def reverse_merge!(other_hash)
    other_hash.merge!(self)
  end

  def stringify_keys
    transform_keys(&:to_s)
  end

  def stringify_keys!
    transform_keys!(&:to_s)
  end

  def symbolize_keys
    transform_keys do |key|
      key.to_sym
    rescue StandardError
      key
    end
  end

  def symbolize_keys!
    transform_keys! do |key|
      key.to_sym
    rescue StandardError
      key
    end
  end

end
