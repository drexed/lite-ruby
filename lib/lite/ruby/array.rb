# frozen_string_literal: true

class Array

  def assert_valid_values!(*valid_values)
    each do |value|
      next if valid_values.include?(value)

      raise ArgumentError,
            "Invalid value: #{value.inspect}." \
            "Allowed values are: #{valid_values.map(&:inspect).join(', ')}"
    end
  end

  def assert_all_valid_values!(*valid_values)
    return assert_valid_values!(*valid_values) unless empty?

    raise ArgumentError, 'An empty array is not allowed'
  end

  def after(value)
    return unless include?(value)

    self[(index(value) + 1) % size]
  end

  def before(value)
    return unless include?(value)

    self[(index(value) - 1) % size]
  end

  # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
  # rubocop:disable Metrics/PerceivedComplexity, Style/GuardClause, Style/IfInsideElse
  def bury(*args)
    if args.count < 2
      raise ArgumentError, '2 or more arguments required'
    elsif args.count == 2
      if args[0].is_a?(Integer)
        self[args[0]] = args[1]
      else
        self << { args[0] => args[1] }
      end
    else
      if args[0].is_a?(Integer)
        arg = args.shift
        self[arg] = [] unless self[arg]
        self[arg].bury(*args)
      else
        self << {}.bury(*args)
      end
    end

    self
  end
  # rubocop:enable Metrics/PerceivedComplexity, Style/GuardClause, Style/IfInsideElse
  # rubocop:enable Metrics/AbcSize, Metrics/MethodLength

  def delete_first
    self[1..-1]
  end

  def delete_first!
    replace(delete_first)
  end

  def delete_last
    self[0...-1]
  end

  def delete_last!
    replace(delete_last)
  end

  def delete_values(*args)
    args.each_with_object([]) { |val, array| array << delete(val) }
  end

  def demote(value)
    sort_by { |val| val == value ? 0 : -1 }
  end

  def demote!(value)
    replace(demote(value))
  end

  def denillify(identity = 0)
    map { |val| val || identity }
  end

  def denillify!(identity = 0)
    replace(denillify(identity))
  end

  def duplicates(minimum = 2)
    hash = Hash.new(0)
    each { |val| hash[val] += 1 }
    hash.delete_if { |_, val| val < minimum }.keys
  end

  def from(position)
    self[position, size] || []
  end

  def fulfill(value, amount)
    return self if amount <= size

    fill(value, size..(amount - 1))
  end

  def groups(number)
    return [] if number <= 0

    num, rem = size.divmod(number)
    collection = (0..(num - 1)).collect { |val| self[(val * number), number] }
    return collection unless rem.positive?

    collection << self[-rem, rem]
  end

  # rubocop:disable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/MethodLength
  def in_groups(number, fill_with = nil)
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

    return collection unless block_given?

    collection.each { |val| yield(val) }
  end
  # rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/MethodLength

  # rubocop:disable Metrics/AbcSize, Metrics/MethodLength, Style/GuardClause
  def in_groups_of(number, fill_with = nil)
    if number.to_i <= 0
      raise ArgumentError, "Group size must be a positive integer, was #{number.inspect}"
    elsif fill_with == false
      collection = self
    else
      padding = (number - size % number) % number
      collection = dup.concat(Array.new(padding, fill_with))
    end

    sliced_collection = collection.each_slice(number)
    return sliced_collection.to_a unless block_given?

    sliced_collection { |val| yield(val) }
  end
  # rubocop:enable Metrics/AbcSize, Metrics/MethodLength, Style/GuardClause

  def indexes(value)
    array = []
    each_with_index { |val, i| array << i if value == val }
    array
  end

  alias indices indexes

  def merge(*values)
    dup.merge!(*values)
  end

  def merge!(*values)
    values.each_with_object(self) { |val, arr| arr.concat(val) }
  end

  def nillify
    map { |val| !val.nil? && (val.try(:blank?) || val.try(:to_s).blank?) ? nil : val }
  end

  def nillify!
    replace(nillify)
  end

  def position(value)
    idx = index(value)
    return idx if idx.nil?

    idx + 1
  end

  def positions(value)
    indexes(value).map { |val| val + 1 }
  end

  def probability
    hash = Hash.new(0.0)
    differ = 0.0

    each do |val|
      hash[val] += 1.0
      differ += 1.0
    end

    hash.each_key { |val| hash[val] /= differ }
    hash
  end

  def promote(value)
    sort_by { |val| val == value ? -1 : 0 }
  end

  def promote!(value)
    replace(promote(value))
  end

  def reject_values(*args)
    reject { |val| args.include?(val) }
  end

  def rposition(value)
    idx = rindex(value)
    return idx if idx.nil?

    idx + 1
  end

  def sample!
    delete_at(Random.rand(size - 1))
  end

  # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
  def split(number = nil)
    array = [[]]

    if block_given?
      each { |val| yield(val) ? (array << []) : (array .last << val) }
    else
      dup_arr = dup

      until dup_arr.empty?
        if (idx = dup_arr.index(number))
          array.last << dup_arr.shift(idx)
          dup_arr.shift
          array << []
        else
          array.last << arr.shift(dup_arr.size)
        end
      end
    end

    array
  end
  # rubocop:enable Metrics/AbcSize, Metrics/MethodLength

  def strip
    reject(&:blank?)
  end

  def strip!
    replace(strip)
  end

  def swap(from, to)
    self[from], self[to] = self[to], self[from]
    self
  end

  def to(position)
    return first(position + 1) if position >= 0

    self[0..position]
  end

  # rubocop:disable Metrics/CyclomaticComplexity
  def to_sentence(options = {})
    words_connector = options[:words_connector] || ', '
    two_words_connector = options[:two_words_connector] || ' and '
    last_word_connector = options[:last_word_connector] || ', and '

    case size
    when 0 then ''
    when 1 then self[0].to_s.dup
    when 2 then "#{self[0]}#{two_words_connector}#{self[1]}"
    else "#{self[0...-1].join(words_connector)}#{last_word_connector}#{self[-1]}"
    end
  end
  # rubocop:enable Metrics/CyclomaticComplexity

end
