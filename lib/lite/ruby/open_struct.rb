# frozen_string_literal: false

require 'ostruct' unless defined?(OpenStruct)

class OpenStruct

  def attributes
    @table
  end

  def replace(args)
    args.each { |key, val| self[key] = val }
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

end
