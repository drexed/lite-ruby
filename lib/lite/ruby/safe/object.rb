# frozen_string_literal: true

class Object

  def blank?
    object = self
    object = object.strip if respond_to?(:strip)
    respond_to?(:empty?) ? object.empty? : !object
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

  def try(method_name = nil, *args, &block)
    if method_name.nil? && block
      block.arity.zero? ? instance_eval(&block) : yield(self)
    elsif respond_to?(method_name)
      public_send(method_name, *args, &block)
    end
  end

  def try!(method_name = nil, *args, &block)
    if method_name.nil? && block
      block.arity.zero? ? instance_eval(&block) : yield(self)
    else
      public_send(method_name, *args, &block)
    end
  end

end
