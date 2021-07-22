# frozen_string_literal: false

class Struct

  def attributes
    each_pair.with_object({}) { |(key, val), hash| hash[key] = val }
  end

  def replace(args)
    args.each_pair { |key, val| self[key] = val }
  end

end
