# frozen_string_literal: false

if Lite::Ruby.configuration.monkey_patches.include?('open_struct')
  require 'ostruct'

  class OpenStruct

    def initialize(hash = nil, &block)
      @table = if block && block.arity == 2
                 Hash.new(&block)
               else
                 {}
               end

      hash&.each do |key, val|
        @table[key.to_sym] = val
        new_ostruct_member!(key)
      end

      yield self if block && block.arity == 1
    end

    def [](key)
      key = key.to_sym unless key.is_a?(Symbol)
      @table[key]
    end

    def []=(key, val)
      raise TypeError, "can't modify frozen #{self.class}", caller(1) if frozen?

      key = key.to_sym unless key.is_a?(Symbol)
      @table[key] = val
    end

    def attributes
      @table
    end

    def replace(args)
      args.each_pair { |key, val| send("#{key}=", val) }
    end

    def to_hash(table: true)
      return attributes unless table

      { table: attributes }
    end

    alias to_h to_hash

    def to_json(table: true)
      to_hash(table: table).to_json
    end

    alias as_json to_json

  end
end
