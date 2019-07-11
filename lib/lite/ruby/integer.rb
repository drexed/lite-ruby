# frozen_string_literal: true

class Integer

  ROMAN_NUMERALS ||= {
    M: 1000, CM: 900, D: 500, CD: 400, C: 100, XC: 90, L: 50, XL: 40, X: 10, IX: 9, V: 5, IV: 4,
    I: 1
  }.freeze

  def factorial
    return 1 if zero?

    2.upto(self).inject(1) { |acc, i| acc * i }
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
