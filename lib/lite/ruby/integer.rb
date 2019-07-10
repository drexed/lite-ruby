# frozen_string_literal: true

class Integer

  ROMAN_VALUES ||= {
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

  def roman
    return '' if zero?
    return "-#{(-self).roman}" if negative?

    ROMAN_VALUES.each { |key, val| return "#{key}#{(self - val).roman}" if val <= self }
  end

  def time
    Time.at(self)
  end

end
