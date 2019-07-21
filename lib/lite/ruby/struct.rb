# frozen_string_literal: false

class Struct

  def [](key)
    send(key)
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
