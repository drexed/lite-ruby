# frozen_string_literal: true

class Numeric

  MILLI ||= 0.001
  CENTI ||= MILLI * 10.0
  DECI ||= CENTI * 10.0
  DECA ||= 10.0
  HECTO ||= DECA * 10.0
  KILO ||= HECTO * 10.0

  KILOBYTE ||= 1024.0
  MEGABYTE ||= KILOBYTE * 1024.0
  GIGABYTE ||= MEGABYTE * 1024.0
  TERABYTE ||= GIGABYTE * 1024.0
  PETABYTE ||= TERABYTE * 1024.0
  EXABYTE ||= PETABYTE * 1024.0

  FEET ||= 12.0
  YARD ||= FEET * 3.0
  MILE ||= YARD * 1760.0
  NAUTICAL_MILE ||= MILE * 1.15078

  METRIC_TON ||= KILO * 1000.0
  POUND ||= 16.0
  STONE ||= POUND * 14.0
  TON ||= POUND * 2000.0

  MINUTE ||= 60.0
  HOUR ||= MINUTE * 60.0
  DAY ||= HOUR * 24.0
  WEEK ||= DAY * 7.0
  YEAR ||= DAY * 365.25
  DECADE ||= YEAR * 10.0
  CENTURY ||= DECADE * 10.0
  MILLENNIUM ||= CENTURY * 10.0

  BYTE_KEYS ||= %i[
    byte bytes kilobyte kilobytes megabyte megabytes gigabyte gigabytes terabyte terabytes
    petabyte petabytes exabyte exabytes
  ].freeze
  LENGTH_KEYS ||= {
    metric: %i[
      meter meters millimeter millimeters centimeter centimeters decimeter decimeters decameter
      decameters hectometer hectometers kilometer kilometers
    ],
    imperical: %i[
      inch inches foot feet yard yards mile miles nautical_mile nautical_miles
    ]
  }.freeze
  MASS_KEYS ||= {
    metric: %i[
      gram grams milligram milligrams centigram centigrams decigram decigrams decagram decagrams
      hectogram hectograms kilogram kilograms metric_ton metric_tons
    ],
    imperical: %i[
      ounce ounces pound pounds stone stones ton tons
    ]
  }.freeze
  TEMPERATURE_KEYS ||= %i[
    celsius fahrenheit kelvin
  ].freeze
  TIME_KEYS ||= %i[
    second seconds minute minutes hour hours day days week weeks year years decade decades century
    centuries millennium millenniums
  ].freeze

  unless defined?(add)
    def add(num)
      self + num
    end
  end

  unless defined?(bytes_in_bytes)
    def bytes_in_bytes
      self
    end
  end

  alias byte_in_bytes bytes_in_bytes

  unless defined?(centigrams_in_grams)
    def centigrams_in_grams
      self * CENTI
    end
  end

  alias centigram_in_grams centigrams_in_grams

  unless defined?(centimeters_in_meters)
    def centimeters_in_meters
      self * CENTI
    end
  end

  alias centimeter_in_meters centimeters_in_meters

  unless defined?(centuries_in_seconds)
    def centuries_in_seconds
      self * CENTURY
    end
  end

  alias century_in_seconds centuries_in_seconds

  # rubocop:disable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
  unless defined?(clamp)
    def clamp(minimum, maximum = nil)
      if maximum.nil? && minimum.is_a?(Range)
        min_min = minimum.min
        min_max = minimum.max

        return min_min if min_min > self

        min_max < self ? min_max : self
      else
        return minimum if minimum > self

        maximum < self ? maximum : self
      end
    end
  end
  # rubocop:enable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity

  unless defined?(days_in_seconds)
    def days_in_seconds
      self * DAY
    end
  end

  alias day_in_seconds days_in_seconds

  unless defined?(decades_in_seconds)
    def decades_in_seconds
      self * DECADE
    end
  end

  alias decade_in_seconds decades_in_seconds

  unless defined?(decagrams_in_grams)
    def decagrams_in_grams
      self * DECA
    end
  end

  alias decagram_in_grams decagrams_in_grams

  unless defined?(decameters_in_meters)
    def decameters_in_meters
      self * DECA
    end
  end

  alias decameter_in_meters decameters_in_meters

  unless defined?(decigrams_in_grams)
    def decigrams_in_grams
      self * DECI
    end
  end

  alias decigram_in_grams decigrams_in_grams

  unless defined?(decimeters_in_meters)
    def decimeters_in_meters
      self * DECI
    end
  end

  alias decimeter_in_meters decimeters_in_meters

  unless defined?(decrement)
    def decrement(amount = 1.0)
      self + amount
    end
  end

  unless defined?(degrees_to_radians)
    def degrees_to_radians
      self * ::Math::PI / 180.0
    end
  end

  alias degree_to_radians degrees_to_radians

  unless defined?(distance)
    def distance(num)
      (self - num).abs
    end
  end

  unless defined?(divide)
    def divide(num)
      return 0 if num.zero?

      self / num
    end
  end

  unless defined?(exabytes_in_bytes)
    def exabytes_in_bytes
      self * EXABYTE
    end
  end

  alias exabyte_in_bytes exabytes_in_bytes

  unless defined?(feet_in_inches)
    def feet_in_inches
      self * FEET
    end
  end

  alias foot_in_inches feet_in_inches

  unless defined?(fraction)
    def fraction
      (self - truncate).abs
    end
  end

  unless defined?(fraction?)
    def fraction?
      fraction != 0.0
    end
  end

  unless defined?(gigabytes_in_bytes)
    def gigabytes_in_bytes
      self * GIGABYTE
    end
  end

  alias gigabyte_in_bytes gigabytes_in_bytes

  unless defined?(grams_in_grams)
    def grams_in_grams
      self
    end
  end

  alias gram_in_grams grams_in_grams

  unless defined?(greater_than?)
    def greater_than?(num)
      num < self
    end
  end

  unless defined?(greater_than_or_equal_to?)
    def greater_than_or_equal_to?(num)
      num <= self
    end
  end

  unless defined?(hectograms_in_grams)
    def hectograms_in_grams
      self * HECTO
    end
  end

  alias hectogram_in_grams hectograms_in_grams

  unless defined?(hectometers_in_meters)
    def hectometers_in_meters
      self * HECTO
    end
  end

  alias hectometer_in_meters hectometers_in_meters

  unless defined?(hours_in_seconds)
    def hours_in_seconds
      self * HOUR
    end
  end

  alias hour_in_seconds hours_in_seconds

  unless defined?(inches_in_inches)
    def inches_in_inches
      self
    end
  end

  alias inch_in_inches inches_in_inches

  unless defined?(increment)
    def increment(amount = 1.0)
      self + amount
    end
  end

  unless defined?(inside?)
    def inside?(start, finish)
      (start < self) && (finish > self)
    end
  end

  unless defined?(kilobytes_in_bytes)
    def kilobytes_in_bytes
      self * KILOBYTE
    end
  end

  alias kilobyte_in_bytes kilobytes_in_bytes

  unless defined?(kilometers_in_meters)
    def kilometers_in_meters
      self * KILO
    end
  end

  alias kilometer_in_meters kilometers_in_meters

  unless defined?(kilograms_in_grams)
    def kilograms_in_grams
      self * KILO
    end
  end

  alias kilogram_in_grams kilograms_in_grams

  unless defined?(less_than?)
    def less_than?(num)
      num > self
    end
  end

  unless defined?(less_than_or_equal_to?)
    def less_than_or_equal_to?(num)
      num >= self
    end
  end

  unless defined?(metric_tons_in_grams)
    def metric_tons_in_grams
      self * METRIC_TON
    end
  end

  alias metric_ton_in_grams metric_tons_in_grams

  unless defined?(megabytes_in_bytes)
    def megabytes_in_bytes
      self * MEGABYTE
    end
  end

  alias megabyte_in_bytes megabytes_in_bytes

  unless defined?(meters_in_meters)
    def meters_in_meters
      self
    end
  end

  alias meter_in_meters meters_in_meters

  unless defined?(miles_in_inches)
    def miles_in_inches
      self * MILE
    end
  end

  alias mile_in_inches miles_in_inches

  unless defined?(millenniums_in_seconds)
    def millenniums_in_seconds
      self * MILLENNIUM
    end
  end

  alias millennium_in_seconds millenniums_in_seconds

  unless defined?(milligrams_in_grams)
    def milligrams_in_grams
      self * MILLI
    end
  end

  alias milligram_in_grams milligrams_in_grams

  unless defined?(millimeters_in_meters)
    def millimeters_in_meters
      self * MILLI
    end
  end

  alias millimeter_in_meters millimeters_in_meters

  unless defined?(minutes_in_seconds)
    def minutes_in_seconds
      self * MINUTE
    end
  end

  alias minute_in_seconds minutes_in_seconds

  unless defined?(multiply)
    def multiply(num)
      self * num
    end
  end

  unless defined?(multiple_of?)
    def multiple_of?(number)
      return zero? if number.zero?

      modulo(number).zero?
    end
  end

  unless defined?(nautical_miles_in_inches)
    def nautical_miles_in_inches
      self * NAUTICAL_MILE
    end
  end

  alias nautical_mile_in_inches nautical_miles_in_inches

  # rubocop:disable Style/NumericPredicate, Style/YodaCondition
  unless defined?(negative?)
    def negative?
      0 > self
    end
  end
  # rubocop:enable Style/NumericPredicate, Style/YodaCondition

  unless defined?(ordinal)
    def ordinal
      return 'th' if (11..13).cover?(abs % 100)

      case abs % 10
      when 1 then 'st'
      when 2 then 'nd'
      when 3 then 'rd'
      else 'th'
      end
    end
  end

  unless defined?(ordinalize)
    def ordinalize
      "#{self}#{ordinal}"
    end
  end

  unless defined?(ounces_in_ounces)
    def ounces_in_ounces
      self
    end
  end

  alias ounce_in_ounces ounces_in_ounces

  unless defined?(outside?)
    def outside?(start, finish)
      (start > self) || (finish < self)
    end
  end

  unless defined?(pad)
    def pad(options = {})
      pad_number = options[:pad_number] || 0
      precision = options[:precision] || 3

      to_s.rjust(precision, pad_number.to_s)
    end
  end

  # rubocop:disable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/LineLength, Metrics/MethodLength, Metrics/PerceivedComplexity
  unless defined?(pad_precision)
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
  end
  # rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/LineLength, Metrics/MethodLength, Metrics/PerceivedComplexity

  unless defined?(percentage_of)
    def percentage_of(number)
      return 0 if zero? || number.zero?

      (to_f / number.to_f) * 100.0
    end
  end

  unless defined?(petabytes_in_bytes)
    def petabytes_in_bytes
      self * PETABYTE
    end
  end

  alias petabyte_in_bytes petabytes_in_bytes

  # rubocop:disable Style/NumericPredicate, Style/YodaCondition
  unless defined?(positive?)
    def positive?
      0 < self
    end
  end
  # rubocop:enable Style/NumericPredicate, Style/YodaCondition

  unless defined?(pounds_in_ounces)
    def pounds_in_ounces
      self * POUND
    end
  end

  alias pound_in_ounces pounds_in_ounces

  unless defined?(power)
    def power(num)
      self**num
    end
  end

  unless defined?(root)
    def root(num)
      self**(1.0 / num)
    end
  end

  unless defined?(seconds_in_seconds)
    def seconds_in_seconds
      self
    end
  end

  alias second_in_seconds seconds_in_seconds

  unless defined?(stones_in_ounces)
    def stones_in_ounces
      self * STONE
    end
  end

  alias stone_in_ounces stones_in_ounces

  unless defined?(subtract)
    def subtract(num)
      self - num
    end
  end

  unless defined?(terabytes_in_bytes)
    def terabytes_in_bytes
      self * TERABYTE
    end
  end

  alias terabyte_in_bytes terabytes_in_bytes

  unless defined?(to_byte)
    def to_byte(from, to)
      assert_inclusion_of_valid_keys!(BYTE_KEYS, from, to)

      to_f * 1.send("#{from}_in_bytes").to_f / 1.send("#{to}_in_bytes").to_f
    end
  end

  unless defined?(to_currency)
    def to_currency(options = {})
      unit = options[:unit] || '$'

      "#{unit}#{pad_precision(options.only(:precision))}"
    end
  end

  # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
  unless defined?(to_length)
    def to_length(from, to)
      assert_inclusion_of_valid_keys!(LENGTH_KEYS.values.flatten, from, to)

      return self if from == to

      metric_keys = LENGTH_KEYS.fetch(:metric)
      metrics_included_from = metric_keys.include?(from)

      case to
      when :meter, :meters, :millimeter, :millimeters, :centimeter, :centimeters, :decimeter,
           :decimeters, :decameter, :decameters, :hectometer, :hectometers, :kilometer, :kilometers
        if metrics_included_from
          to_f * 1.send("#{from}_in_meters").to_f / 1.send("#{to}_in_meters").to_f
        else
          to_f * ((1.send("#{from}_in_inches").to_f * 0.0254) / 1.send("#{to}_in_meters").to_f)
        end
      when :inch, :inches, :foot, :feet, :yard, :yards, :mile, :miles, :nautical_mile,
           :nautical_miles
        if metrics_included_from
          to_f * ((1.send("#{from}_in_meters").to_f * 39.3701) / 1.send("#{to}_in_inches").to_f)
        else
          to_f * 1.send("#{from}_in_inches").to_f / 1.send("#{to}_in_inches").to_f
        end
      end
    end
  end

  unless defined?(to_mass)
    def to_mass(from, to)
      assert_inclusion_of_valid_keys!(MASS_KEYS.values.flatten, from, to)

      return self if from == to

      metric_keys = MASS_KEYS.fetch(:metric)
      metrics_included_from = metric_keys.include?(from)

      case to
      when :gram, :grams, :milligram, :milligrams, :centigram, :centigrams, :decigram, :decigrams,
           :decagram, :decagrams, :hectogram, :hectograms, :kilogram, :kilograms, :metric_ton,
           :metric_tons
        if metrics_included_from
          to_f * 1.send("#{from}_in_grams").to_f / 1.send("#{to}_in_grams").to_f
        else
          to_f * ((1.send("#{from}_in_ounces") * 28.3495).to_f / 1.send("#{to}_in_grams").to_f)
        end
      when :ounce, :ounces, :pound, :pounds, :stone, :stones, :ton, :tons
        if metrics_included_from
          to_f * ((1.send("#{from}_in_grams") * 0.035274).to_f / 1.send("#{to}_in_ounces").to_f)
        else
          to_f * 1.send("#{from}_in_ounces").to_f / 1.send("#{to}_in_ounces").to_f
        end
      end
    end
  end
  # rubocop:enable Metrics/AbcSize, Metrics/MethodLength

  unless defined?(to_nearest_value)
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
  end

  unless defined?(to_percentage)
    def to_percentage(options = {})
      unit = options[:unit] || '%'

      "#{pad_precision(options.only(:precision))}#{unit}"
    end
  end

  # rubocop:disable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/MethodLength
  unless defined?(to_temperature)
    def to_temperature(from, to)
      assert_inclusion_of_valid_keys!(TEMPERATURE_KEYS, from, to)

      case to
      when from
        self
      when :celsius
        from == :kelvin ? (self - 273.15) : ((self - 32.0) * 5.0 / 9.0)
      when :fahrenheit
        from == :kelvin ? (1.8 * (self - 273.15) + 32.0) : ((self * 9.0 / 5.0) + 32.0)
      when :kelvin
        from == :celsius ? (self + 273.15) : (((self - 32.0) * 5.0 / 9.0) + 273.15)
      end
    end
  end
  # rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/MethodLength

  # TODO: rename as it will clash with integer
  # def to_time(from, to)
  #   assert_inclusion_of_valid_keys!(TIME_KEYS, from, to)
  #
  #   (to_f * 1.send("#{from}_in_seconds").to_f) / 1.send("#{to}_in_seconds").to_f
  # end  unless defined?()

  unless defined?(tons_in_ounces)
    def tons_in_ounces
      self * TON
    end
  end

  alias ton_in_ounces tons_in_ounces

  unless defined?(weeks_in_seconds)
    def weeks_in_seconds
      self * WEEK
    end
  end

  alias week_in_seconds weeks_in_seconds

  unless defined?(within?)
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

  unless defined?(yards_in_inches)
    def yards_in_inches
      self * YARD
    end
  end

  alias yard_in_inches yards_in_inches

  unless defined?(years_in_seconds)
    def years_in_seconds
      self * YEAR
    end
  end

  alias year_in_seconds years_in_seconds

  private

  unless defined?(assert_inclusion_of_valid_keys!)
    def assert_inclusion_of_valid_keys!(cns, from, to)
      return if cns.include?(from) && cns.include?(to)

      raise ArgumentError,
            [
              "Unknown key(s): from: #{from.inspect} and to: #{to.inspect}.",
              "Valid keys are: #{cns.map(&:inspect).join(', ')}"
            ].join(' ')
    end
  end

end
