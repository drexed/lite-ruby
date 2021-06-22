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

    def attributes
      @table
    end

    def replace(args)
      args.each { |key, val| send("#{key}=", val) }
    end

    def to_hash(table: true)
      return attributes unless table

      { table: attributes }
    end

    def to_json(table: true)
      to_hash(table: table).to_json
    end

    alias as_json to_json
    alias to_h to_hash

    private

    def new_ostruct_member!(name)
      return if is_method_protected!(name)

      define_singleton_method!(name) { @table[name] }
      define_singleton_method!("#{name}=") { |x| @table[name] = x }
    end

  end
end
