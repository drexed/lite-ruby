# frozen_string_literal: true

class Array

  def deep_dup
    map(&:deep_dup)
  end

  def extract!
    return to_enum(:extract!) { size } unless block_given?

    extracted_elements = []
    reject! { |element| extracted_elements << element if yield(element) }
    extracted_elements
  end

  def from(position)
    self[position, size] || []
  end

  # rubocop:disable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/MethodLength
  def in_groups(number, fill_with = nil, &block)
    collection_size = size
    division = collection_size.div(number)
    modulo = collection_size % number
    collection = []
    start = 0

    number.times do |int|
      mod_gt_zero = modulo.positive?
      grouping = division + (mod_gt_zero && modulo > int ? 1 : 0)
      collection << last_group = slice(start, grouping)
      last_group << fill_with if (fill_with != false) && mod_gt_zero && (grouping == division)
      start += grouping
    end

    return collection unless defined?(yield)

    collection.each(&block)
  end
  # rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/MethodLength

  # rubocop:disable Metrics/MethodLength, Style/GuardClause
  def in_groups_of(number, fill_with = nil, &block)
    if number.to_i <= 0
      raise ArgumentError, "Group size must be a positive integer, was #{number.inspect}"
    elsif fill_with == false
      collection = self
    else
      padding = (number - size % number) % number
      collection = dup.concat(Array.new(padding, fill_with))
    end

    sliced_collection = collection.each_slice(number)
    return sliced_collection.to_a unless defined?(yield)

    sliced_collection(&block)
  end
  # rubocop:enable Metrics/MethodLength, Style/GuardClause

  # rubocop:disable Metrics/MethodLength, Style/ExplicitBlockArgument
  def split(value = nil)
    arr = dup
    result = []

    if block_given?
      while (idx = arr.index { |i| yield(i) })
        result << arr.shift(idx)
        arr.shift
      end
    else
      while (idx = arr.index(value))
        result << arr.shift(idx)
        arr.shift
      end
    end

    result << arr
  end
  # rubocop:enable Metrics/MethodLength, Style/ExplicitBlockArgument

  def to(position)
    return first(position + 1) if position >= 0

    self[0..position]
  end

  def to_sentence(options = {})
    words_connector = options[:words_connector] || ', '
    two_words_connector = options[:two_words_connector] || ' and '
    last_word_connector = options[:last_word_connector] || ', and '

    case size
    when 0 then ''
    when 1 then self[0].to_s
    when 2 then "#{self[0]}#{two_words_connector}#{self[1]}"
    else "#{self[0...-1].join(words_connector)}#{last_word_connector}#{self[-1]}"
    end
  end

  alias compact_blank strip
  alias compact_blank! strip!

end
