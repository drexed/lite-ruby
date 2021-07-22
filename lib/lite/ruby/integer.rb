# frozen_string_literal: true

require 'yaml' unless defined?(YAML)

class Integer

  ROMAN_NUMERALS = YAML.load_file(
    File.expand_path('formats/integer_roman_numerals.yml', File.dirname(__FILE__))
  ).freeze

  SQL_SMALLINT = 32_767
  SQL_INTEGER = 2_147_483_647
  SQL_BIGINT = 9_223_372_036_854_775_807

  def bit(bit)
    if bit.negative?
      mask = (1 << ~bit)
      self & ~mask
    else
      mask = (1 << bit)
      self | mask
    end
  end

  def bit?(bit)
    mask = (1 << bit)
    (self & mask) != 0
  end

  def bit_clear(bit)
    mask = (1 << bit)
    self & ~mask
  end

  def bitmask(mask)
    if mask.negative?
      self & mask
    else
      self | mask
    end
  end

  def bitmask?(mask)
    (self & mask) != 0
  end

  def combinatorial(num)
    (0...num).inject(1) { |acc, i| (acc * (self - i)) / (i + 1) }
  end

  def factorial
    (1..self).inject { |acc, i| acc * i } || 0
  end

  def factors
    limit = Math.sqrt(self).floor

    (1..limit).each_with_object([]) do |i, array|
      next unless (self % i).zero?

      sq = (self / i)
      array.push(i)
      array.push(sq) if sq != i
    end
  end

  def of(&block)
    Array.new(self, &block)
  end

  def roman_numeral
    return '' if zero?
    return "-#{(-self).roman_numeral}" if negative?

    ROMAN_NUMERALS.each { |key, val| break "#{key}#{(self - val).roman_numeral}" if val <= self }
  end

  def to_time
    Time.at(self)
  end

  alias to_t to_time unless defined?(to_t)

end
