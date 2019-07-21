# frozen_string_literal: false

require 'ostruct'

class OpenStruct

  def initialize(hash = nil, &block)
    if block && block.arity == 2
      @table = Hash.new(&block)
    else
      @table = {}
    end

    hash.each do |key, val|
      @table[key.to_sym] = val
      new_ostruct_member(key)
    end

    yield self if block && block.arity == 1
  end

  def [](key)
    key = key.to_sym unless key.is_a?(Symbol)
    @table[key]
  end

  def []=(key, val)
    raise TypeError, "can't modify frozen #{self.class}", caller(1) if self.frozen?

    key = key.to_sym unless key.is_a?(Symbol)
    @table[key] = val
  end

  def attributes
    each_pair.with_object({}) { |(key, val), hash| hash[key] = val }
  end

  def replace(args)
    args.each_pair { |key, val| send("#{key}=", val) }
  end

end
