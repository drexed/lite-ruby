# frozen_string_literal: true

module Enumerable

  def exclude?(object)
    !include?(object)
  end

  def excluding(*elements)
    elements.flatten!(1)
    reject { |element| elements.include?(element) }
  end

  def including(*elements)
    to_a.including(*elements)
  end

  def many?
    found_count = 0

    if defined?(yield)
      any? do |val|
        found_count += 1 if yield(val)
        found_count > 1
      end
    else
      any? { (found_count += 1) > 1 }
    end
  end

  def pluck(*keys)
    if keys.many?
      map { |element| keys.map { |key| element[key] } }
    else
      map { |element| element[keys.first] }
    end
  end

  alias with including
  alias without excluding

end
