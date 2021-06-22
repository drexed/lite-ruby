# frozen_string_literal: false

if Lite::Ruby.configuration.monkey_patches.include?('struct')
  class Struct

    def [](key)
      attributes[key.to_sym]
    end

    def []=(key, val)
      send("#{key}=", val)
    end

    def attributes
      each_pair.with_object({}) { |(key, val), hash| hash[key] = val }
    end

    def replace(args)
      args.each_pair { |key, val| send("#{key}=", val) }
    end

  end
end
