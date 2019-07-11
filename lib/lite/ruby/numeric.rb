# frozen_string_literal: true

class Numeric

  BASE_SIZE ||= 1
  BASE_SIZES ||= {
    milli: BASE_SIZE / 1000.0, centi: BASE_SIZE / 100.0, deci: BASE_SIZE / 10.0,
    deca: BASE_SIZE * 10.0, hecto: BASE_SIZE * 100.0, kilo: BASE_SIZE * 1000.0
  }.freeze

  BYTE_KEYS ||= %i[
    byte bytes kilobyte kilobytes megabyte megabytes gigabyte gigabytes terabyte terabytes
    petabyte petabytes exabyte exabytes
  ].freeze
  BASE_BYTE ||= 1024.0
  BASE_BYTES ||= {
    kilo: BASE_BYTE, mega: BASE_BYTE**2, giga: BASE_BYTE**3,
    tera: BASE_BYTE**4, peta: BASE_BYTE**5, exa: BASE_BYTE**6
  }.freeze

  LENGTH_KEYS ||= {
    metric: %i[
      meter meters millimeter millimeters centimeter centimeters decimeter decimeters decameter
      decameters hectometer hectometers kilometer kilometers
    ],
    emperical: %i[
      inch inches foot feet yard yards mile miles nautical_mile nautical_miles
    ]
  }.freeze
  BASE_LENGTH ||= 12.0
  BASE_LENGTHS ||= {
    feet: BASE_LENGTH, yard: BASE_LENGTH * 3.0, mile: BASE_LENGTH * 5280.0,
    nautical_mile: BASE_LENGTH * 6076.118399999999
  }.freeze

  WEIGHT_KEYS ||= {
    metric: %i[
      gram grams milligram milligrams centigram centigrams decigram decigrams decagram decagrams
      hectogram hectograms kilogram kilograms metric_ton metric_tons
    ],
    emperical: %i[
      ounce ounces pound pounds stone stones ton tons
    ]
  }.freeze
  BASE_WEIGHT ||= 16.0
  BASE_WEIGHTS ||= {
    pound: BASE_WEIGHT, stone: BASE_WEIGHT * 14.0, ton: BASE_WEIGHT * 2000.0,
    metric_ton: 1_000_000.0
  }.freeze

  TIME_KEYS ||= %i[
    second seconds minute minutes hour hours day days week weeks year years decade decades century
    centuries millennium millenniums
  ].freeze
  BASE_TIME ||= 60.0
  BASE_TIMES ||= {
    minute: BASE_TIME, hour: BASE_TIME**2, day: BASE_TIME * 1440.0,
    week: BASE_TIME * 10_080.0, year: BASE_TIME * 525_960.0, decade: BASE_TIME * 5_259_600.0,
    century: BASE_TIME * 52_596_000.0, millennium: BASE_TIME * 525_960_000.0
  }.freeze

  TEMPERATURE_KEYS ||= %i[
    celsius fahrenheit kelvin
  ].freeze

  # TODO: remove unless definded
  # TODO: remove already implemented methods

  unless defined?(add)
    def add(num)
      self + num
    end
  end

  unless defined?(base_unit)
    def base_unit
      self
    end

    alias byte_in_bytes base_unit unless defined?(byte_in_bytes)
    alias bytes_in_bytes base_unit unless defined?(bytes_in_bytes)
    alias gram_in_grams base_unit unless defined?(gram_in_grams)
    alias grams_in_grams base_unit unless defined?(grams_in_grams)
    alias inch_in_inches base_unit unless defined?(inch_in_inches)
    alias inches_in_inches base_unit unless defined?(inches_in_inches)
    alias meter_in_meters base_unit unless defined?(meter_in_meters)
    alias meters_in_meters base_unit unless defined?(meters_in_meters)
    alias ounce_in_ounces base_unit unless defined?(ounce_in_ounces)
    alias ounces_in_ounces base_unit unless defined?(ounces_in_ounces)
    alias second_in_seconds base_unit unless defined?(second_in_seconds)
    alias seconds_in_seconds base_unit unless defined?(seconds_in_seconds)
  end

  unless defined?(centigrams_in_grams)
    def centigrams_in_grams
      self * BASE_SIZES[:centi]
    end

    alias centigram_in_grams centigrams_in_grams unless defined?(centigram_in_grams)
  end

  unless defined?(centimeters_in_meters)
    def centimeters_in_meters
      self * BASE_SIZES[:centi]
    end

    alias centimeter_in_meters centimeters_in_meters unless defined?(centimeter_in_meters)
  end

  unless defined?(centuries_in_seconds)
    def centuries_in_seconds
      self * BASE_TIMES[:century]
    end

    alias century_in_seconds centuries_in_seconds unless defined?(century_in_seconds)
  end

  # rubocop:disable Metrics/MethodLength
  unless defined?(clamp)
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
  end
  # rubocop:enable Metrics/MethodLength

  unless defined?(days_in_seconds)
    def days_in_seconds
      self * BASE_TIMES[:day]
    end

    alias day_in_seconds days_in_seconds unless defined?(day_in_seconds)
  end

  unless defined?(decades_in_seconds)
    def decades_in_seconds
      self * BASE_TIMES[:decade]
    end

    alias decade_in_seconds decades_in_seconds unless defined?(decade_in_seconds)
  end

  unless defined?(decagrams_in_grams)
    def decagrams_in_grams
      self * BASE_SIZES[:deca]
    end

    alias decagram_in_grams decagrams_in_grams unless defined?(decagram_in_grams)
  end

  unless defined?(decameters_in_meters)
    def decameters_in_meters
      self * BASE_SIZES[:deca]
    end

    alias decameter_in_meters decameters_in_meters unless defined?(decameter_in_meters)
  end

  unless defined?(decigrams_in_grams)
    def decigrams_in_grams
      self * BASE_SIZES[:deci]
    end

    alias decigram_in_grams decigrams_in_grams unless defined?(decigram_in_grams)
  end

  unless defined?(decimeters_in_meters)
    def decimeters_in_meters
      self * BASE_SIZES[:deci]
    end

    alias decimeter_in_meters decimeters_in_meters unless defined?(decimeter_in_meters)
  end

  unless defined?(decrement)
    def decrement(amount = 1.0)
      self - amount
    end
  end

  unless defined?(degrees_to_radians)
    def degrees_to_radians
      self * Math::PI / 180.0
    end

    alias degree_to_radians degrees_to_radians unless defined?(degree_to_radians)
  end

  unless defined?(distance)
    def distance(num)
      (self - num).abs
    end
  end

  unless defined?(divide)
    def divide(num)
      return num if num.zero?

      self / num
    end
  end

  unless defined?(exabytes_in_bytes)
    def exabytes_in_bytes
      self * BASE_BYTES[:exa]
    end

    alias exabyte_in_bytes exabytes_in_bytes unless defined?(exabyte_in_bytes)
  end

  unless defined?(equal_to?)
    def equal_to?(num)
      self == num
    end

    alias eq? equal_to? unless defined?(eq?)
  end

  unless defined?(feet_in_inches)
    def feet_in_inches
      self * BASE_LENGTHS[:feet]
    end

    alias foot_in_inches feet_in_inches unless defined?(foot_in_inches)
  end

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
      self * BASE_BYTES[:giga]
    end

    alias gigabyte_in_bytes gigabytes_in_bytes unless defined?(gigabyte_in_bytes)
  end

  unless defined?(greater_than?)
    def greater_than?(num)
      num < self
    end

    alias gt? greater_than? unless defined?(gt?)
  end

  unless defined?(greater_than_or_equal_to?)
    def greater_than_or_equal_to?(num)
      num <= self
    end

    alias gteq? greater_than_or_equal_to? unless defined?(gteq?)
  end

  unless defined?(hectograms_in_grams)
    def hectograms_in_grams
      self * BASE_SIZES[:hecto]
    end

    alias hectogram_in_grams hectograms_in_grams unless defined?(hectogram_in_grams)
  end

  unless defined?(hectometers_in_meters)
    def hectometers_in_meters
      self * BASE_SIZES[:hecto]
    end

    alias hectometer_in_meters hectometers_in_meters unless defined?(hectometer_in_meters)
  end

  unless defined?(hours_in_seconds)
    def hours_in_seconds
      self * BASE_TIMES[:hour]
    end

    alias hour_in_seconds hours_in_seconds unless defined?(hour_in_seconds)
  end

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
      self * BASE_BYTES[:kilo]
    end

    alias kilobyte_in_bytes kilobytes_in_bytes unless defined?(kilobyte_in_bytes)
  end

  unless defined?(kilometers_in_meters)
    def kilometers_in_meters
      self * BASE_SIZES[:kilo]
    end

    alias kilometer_in_meters kilometers_in_meters unless defined?(kilometer_in_meters)
  end

  unless defined?(kilograms_in_grams)
    def kilograms_in_grams
      self * BASE_SIZES[:kilo]
    end

    alias kilogram_in_grams kilograms_in_grams unless defined?(kilogram_in_grams)
  end

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
      self * BASE_WEIGHTS[:metric_ton]
    end

    alias metric_ton_in_grams metric_tons_in_grams unless defined?(metric_ton_in_grams)
  end

  unless defined?(megabytes_in_bytes)
    def megabytes_in_bytes
      self * BASE_BYTES[:mega]
    end

    alias megabyte_in_bytes megabytes_in_bytes unless defined?(megabyte_in_bytes)
  end

  unless defined?(miles_in_inches)
    def miles_in_inches
      self * BASE_LENGTHS[:mile]
    end

    alias mile_in_inches miles_in_inches unless defined?(mile_in_inches)
  end

  unless defined?(millenniums_in_seconds)
    def millenniums_in_seconds
      self * BASE_TIMES[:millennium]
    end

    alias millennium_in_seconds millenniums_in_seconds unless defined?(millennium_in_seconds)
  end

  unless defined?(milligrams_in_grams)
    def milligrams_in_grams
      self * BASE_SIZES[:milli]
    end

    alias milligram_in_grams milligrams_in_grams unless defined?(milligram_in_grams)
  end

  unless defined?(millimeters_in_meters)
    def millimeters_in_meters
      self * BASE_SIZES[:milli]
    end

    alias millimeter_in_meters millimeters_in_meters unless defined?(millimeter_in_meters)
  end

  unless defined?(minutes_in_seconds)
    def minutes_in_seconds
      self * BASE_TIMES[:minute]
    end

    alias minute_in_seconds minutes_in_seconds unless defined?(minute_in_seconds)
  end

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
      self * BASE_LENGTHS[:nautical_mile]
    end

    alias nautical_mile_in_inches nautical_miles_in_inches unless defined?(nautical_mile_in_inches)
  end

  # rubocop:disable Style/NumericPredicate, Style/YodaCondition
  unless defined?(negative?)
    def negative?
      0 > self
    end
  end
  # rubocop:enable Style/NumericPredicate, Style/YodaCondition

  unless defined?(equal_to?)
    def not_equal_to?(num)
      self != num
    end

    alias not_eq? not_equal_to? unless defined?(not_eq?)
    alias inequal_to? not_equal_to? unless defined?(inequal_to?)
    alias ineq? not_equal_to? unless defined?(ineq?)
  end

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

  # rubocop:disable Metrics/AbcSize, Metrics/CyclomaticComplexity
  # rubocop:disable Metrics/MethodLength, Metrics/PerceivedComplexity
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
  # rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity
  # rubocop:enable Metrics/MethodLength, Metrics/PerceivedComplexity

  unless defined?(percentage_of)
    def percentage_of(number)
      return 0 if zero? || number.zero?

      (self / number.to_f) * 100.0
    end
  end

  unless defined?(petabytes_in_bytes)
    def petabytes_in_bytes
      self * BASE_BYTES[:peta]
    end

    alias petabyte_in_bytes petabytes_in_bytes unless defined?(petabyte_in_bytes)
  end

  # rubocop:disable Style/NumericPredicate, Style/YodaCondition
  unless defined?(positive?)
    def positive?
      0 < self
    end
  end
  # rubocop:enable Style/NumericPredicate, Style/YodaCondition

  unless defined?(pounds_in_ounces)
    def pounds_in_ounces
      self * BASE_WEIGHTS[:pound]
    end

    alias pound_in_ounces pounds_in_ounces unless defined?(pound_in_ounces)
  end

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

  unless defined?(stones_in_ounces)
    def stones_in_ounces
      self * BASE_WEIGHTS[:stone]
    end

    alias stone_in_ounces stones_in_ounces unless defined?(stone_in_ounces)
  end

  unless defined?(subtract)
    def subtract(num)
      self - num
    end
  end

  unless defined?(terabytes_in_bytes)
    def terabytes_in_bytes
      self * BASE_BYTES[:tera]
    end

    alias terabyte_in_bytes terabytes_in_bytes unless defined?(terabyte_in_bytes)
  end

  unless defined?(to_byte)
    def to_byte(from, to)
      assert_valid_keys!(BYTE_KEYS, from, to)

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
      assert_valid_keys!(LENGTH_KEYS.values.flatten, from, to)

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
      assert_valid_keys!(WEIGHT_KEYS.values.flatten, from, to)

      return self if from == to

      metric_keys = WEIGHT_KEYS.fetch(:metric)
      metrics_included_from = metric_keys.include?(from)

      case to
      when :gram, :grams, :milligram, :milligrams, :centigram, :centigrams, :decigram, :decigrams,
           :decagram, :decagrams, :hectogram, :hectograms, :kilogram, :kilograms, :metric_ton,
           :metric_tons
        if metrics_included_from
          self * 1.send("#{from}_in_grams") / 1.send("#{to}_in_grams").to_f
        else
          self * ((1.send("#{from}_in_ounces") * 28.3495) / 1.send("#{to}_in_grams").to_f)
        end
      when :ounce, :ounces, :pound, :pounds, :stone, :stones, :ton, :tons
        if metrics_included_from
          self * ((1.send("#{from}_in_grams") * 0.035274) / 1.send("#{to}_in_ounces").to_f)
        else
          self * 1.send("#{from}_in_ounces") / 1.send("#{to}_in_ounces").to_f
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
      assert_valid_keys!(TEMPERATURE_KEYS, from, to)

      celcius = 5.0 / 9.0
      fahrenheit = 32.0
      kelvin = 273.15

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
  #   assert_valid_keys!(TIME_KEYS, from, to)
  #
  #   (to_f * 1.send("#{from}_in_seconds").to_f) / 1.send("#{to}_in_seconds").to_f
  # end  unless defined?()

  unless defined?(tons_in_ounces)
    def tons_in_ounces
      self * BASE_WEIGHTS[:ton]
    end

    alias ton_in_ounces tons_in_ounces unless defined?(ton_in_ounces)
  end

  unless defined?(weeks_in_seconds)
    def weeks_in_seconds
      self * BASE_TIMES[:week]
    end

    alias week_in_seconds weeks_in_seconds unless defined?(week_in_seconds)
  end

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
      self * BASE_LENGTHS[:yard]
    end

    alias yard_in_inches yards_in_inches unless defined?(yard_in_inches)
  end

  unless defined?(years_in_seconds)
    def years_in_seconds
      self * BASE_TIMES[:year]
    end

    alias year_in_seconds years_in_seconds unless defined?(year_in_seconds)
  end

  private

  unless defined?(assert_valid_keys!)
    def assert_valid_keys!(keys, from, to)
      return if keys.include?(from) && keys.include?(to)

      raise ArgumentError,
            [
              "Unknown key(s): from: #{from.inspect} and/or to: #{to.inspect}.",
              "Valid keys are: #{keys.map(&:inspect).join(', ')}"
            ].join(' ')
    end
  end

end
