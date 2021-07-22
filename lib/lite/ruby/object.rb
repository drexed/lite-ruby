# frozen_string_literal: true

class Object

  FALSE_VALUES = %w[
    0 f false n no off
  ].freeze
  TRUE_VALUES = %w[
    1 t true y yes on
  ].freeze

  # NOTE: There is a clash between the PG gem and the `array?` method.
  #       We only need to skip this on migrations since that action
  #       happens on a seperate runtime.
  unless defined?(PG) && ARGV.first.to_s.start_with?('db:')
    def array?
      is_a?(Array)
    end
  end

  def bool?
    true? || false?
  end

  def boolean?
    val = to_s.downcase
    TRUE_VALUES.include?(val) || FALSE_VALUES.include?(val)
  end

  def date?
    is_a?(Date)
  end

  # rubocop:disable Style/YodaCondition
  def false?
    false == self
  end
  # rubocop:enable Style/YodaCondition

  def falsey?
    nil? || FALSE_VALUES.include?(to_s.downcase)
  end

  def float?
    is_a?(Float)
  end

  def hash?
    is_a?(Hash)
  end

  def integer?
    is_a?(Integer)
  end

  # rubocop:disable Naming/PredicateName
  def is_any?(*objects)
    objects.any? { |obj| is_a?(obj) }
  end
  # rubocop:enable Naming/PredicateName

  def numeral?
    !to_s.match(/\A[+-]?\d+?(\.\d+)?\Z/).nil?
  end

  def numeric?
    is_a?(Numeric)
  end

  def open_struct?
    is_a?(OpenStruct)
  end

  def palindrome?
    to_s == to_s.reverse
  end

  def range?
    is_a?(Range)
  end

  def safe_call(...)
    try_call(...) || self
  end

  def safe_send(...)
    try_send(...) || self
  end

  def safe_try(...)
    try(...) || self
  end

  def salvage(placeholder = '---')
    blank? ? placeholder : self
  end

  def salvage_try(method_name = nil, *args, placeholder: '---', &block)
    try(method_name, *args, &block).salvage(placeholder)
  end

  def send_chain(*args)
    Array(args).inject(self) { |obj, argz| obj.send(*argz) }
  end

  def send_chain_if(*args)
    Array(args).inject(self) { |obj, argz| obj.send_if(*argz) }
  end

  def send_if(key, *args, **kwargs, &block)
    return self unless respond_to?(key)

    send(key, *args, **kwargs, &block)
  end

  def set?
    is_a?(Set)
  end

  def string?
    is_a?(String)
  end

  def struct?
    is_a?(Struct)
  end

  def symbol?
    is_a?(Symbol)
  end

  def time?
    is_a?(Time)
  end

  def to_bool
    return true if truthy?
    return false if falsey?

    nil
  end

  # rubocop:disable Style/YodaCondition
  def true?
    true == self
  end
  # rubocop:enable Style/YodaCondition

  def truthy?
    TRUE_VALUES.include?(to_s.downcase)
  end

  def try_call(...)
    return unless respond_to?(:call)

    call(...)
  end

  def try_send(...)
    send(...)
  rescue StandardError
    nil
  end

  alias to_b to_bool

end

require 'lite/ruby/safe/object' unless defined?(ActiveSupport)
