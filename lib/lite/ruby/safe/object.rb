# frozen_string_literal: true

class Object

  def blank?
    object = self
    object = object.strip if respond_to?(:strip)
    return object.empty? if respond_to?(:empty?)

    !object
  end

  def deep_dup
    duplicable? ? dup : self
  end

  def duplicable?
    true
  end

  def present?
    !blank?
  end

  def presence
    self if present?
  end

  def try(*obj, &block)
    try!(*obj, &block) if obj.empty? || respond_to?(obj.first)
  end

  def try!(*obj, &block)
    if obj.empty? && defined?(yield)
      block.arity.zero? ? instance_eval(&block) : yield(self)
    else
      public_send(*obj, &block)
    end
  end

end
