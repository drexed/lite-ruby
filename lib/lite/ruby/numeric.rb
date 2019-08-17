# frozen_string_literal: true

if Lite::Ruby.configuration.monkey_patches.include?('numeric')
  class Numeric

    def add(num)
      self + num
    end

    def at_least(lower)
      self >= lower ? self : lower
    end

    def at_most(upper)
      self <= upper ? self : upper
    end

    # rubocop:disable Metrics/MethodLength
    def clamp(minimum, maximum = nil)
      if minimum.is_a?(Range)
        maximum = minimum.max
        minimum = minimum.min
      end

      if minimum > self
        minimum
      elsif maximum < self
        maximum
      else
        self
      end
    end
    # rubocop:enable Metrics/MethodLength

    def close?(number, epsilon = 0.01)
      return self == number if epsilon.zero?

      a = to_f
      b = number.to_f

      if a.zero? || b.zero?
        (a - b).abs < epsilon
      else
        (a / b - 1).abs < epsilon
      end
    end

    def decrement(amount = 1.0)
      self - amount
    end

    def delimit(options = {})
      delimiter = options[:delimiter] || ','
      separator = options[:separator] || '.'

      digits, decimals = to_s.split('.')
      digits = digits.reverse.chars.each_slice(3).map(&:join).join(delimiter).reverse

      return digits unless decimals

      [digits, decimals].join(separator)
    end

    def delta(num)
      (self - num).abs
    end

    def distance(num)
      self - num
    end

    def divide(num)
      return num if num.zero?

      self / num
    end

    def equal_to?(num)
      self == num
    end

    alias eq? equal_to?

    def fraction
      (self - truncate).abs
    end

    def fraction?
      fraction != 0.0
    end

    def greater_than?(num)
      num < self
    end

    alias gt? greater_than?

    def greater_than_or_equal_to?(num)
      num <= self
    end

    alias gteq? greater_than_or_equal_to?

    def increment(amount = 1.0)
      self + amount
    end

    def inside?(start, finish)
      (start < self) && (finish > self)
    end

    def less_than?(num)
      num > self
    end

    alias lt? less_than?

    def less_than_or_equal_to?(num)
      num >= self
    end

    alias lteq? less_than_or_equal_to?

    def markdown_percentage(percent)
      to_f * ((100.0 - percent.to_f) / 100.0)
    end

    def markup_percentage(percent)
      to_f + (to_f * (percent.to_f / 100.0))
    end

    def multiply(num)
      self * num
    end

    def multiple_of?(number)
      return zero? if number.zero?

      modulo(number).zero?
    end

    def not_equal_to?(num)
      self != num
    end

    alias not_eq? not_equal_to?
    alias inequal_to? not_equal_to?
    alias ineq? not_equal_to?

    def ordinal
      return 'th' if (11..13).cover?(abs % 100)

      case abs % 10
      when 1 then 'st'
      when 2 then 'nd'
      when 3 then 'rd'
      else 'th'
      end
    end

    def ordinalize
      "#{self}#{ordinal}"
    end

    def outside?(start, finish)
      (start > self) || (finish < self)
    end

    def pad(options = {})
      pad_number = options[:pad_number] || 0
      precision = options[:precision] || 3

      to_s.rjust(precision, pad_number.to_s)
    end

    # rubocop:disable Metrics/AbcSize, Metrics/CyclomaticComplexity
    # rubocop:disable Metrics/MethodLength, Metrics/PerceivedComplexity
    def pad_precision(options = {})
      pad_number = options[:pad_number] || 0
      precision = options[:precision] || 2
      separator = options[:separator] || '.'
      string = to_s

      string << separator unless string.include?(separator)
      ljust_count = string.split(separator).first.length
      ljust_count += (string.count(separator) + precision) if precision.positive?

      if ljust_count >= string.length
        string.ljust(ljust_count, pad_number.to_s)
      else
        string[0..(ljust_count - 1)]
      end
    end
    # rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity
    # rubocop:enable Metrics/MethodLength, Metrics/PerceivedComplexity

    def percentage_of(number)
      return 0 if zero? || number.zero?

      (self / number.to_f) * 100.0
    end

    def power(num)
      self**num
    end

    def range(value)
      (self - value)..(self + value)
    end

    alias plus_minus range

    def root(num)
      self**(1.0 / num)
    end

    def subtract(num)
      self - num
    end

    def to_currency(options = {})
      unit = options[:unit] || '$'

      "#{unit}#{pad_precision(options.only(:precision))}"
    end

    def to_nearest_value(values = [])
      return self if values.length.zero?

      value = values.first
      difference = (self - value).abs

      values.each do |val|
        next unless (self - val).abs < difference

        difference = (self - val).abs
        value = val
      end

      value
    end

    def to_percentage(options = {})
      unit = options[:unit] || '%'

      "#{pad_precision(options.only(:precision))}#{unit}"
    end

    def within?(number, epsilon = 0.01)
      return number == self if epsilon.zero?

      alpha = to_f
      beta = number.to_f

      if alpha.zero? || beta.zero?
        (alpha - beta).abs < epsilon
      else
        (alpha / beta - 1).abs < epsilon
      end
    end

  end
end
