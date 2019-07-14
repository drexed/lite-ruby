# frozen_string_literal: true

module Enumerable

  def cluster
    each_with_object([]) do |ele, results|
      last_res = results.last

      if last_res && (yield(ele) == yield(last_res.last))
        last_res << ele
      else
        results << [ele]
      end
    end
  end

  def deduce(identity = 0, &block)
    if block_given?
      map(&block).deduce(identity)
    else
      inject { |key, val| key - val } || identity
    end
  end

  def drop_last(num)
    collection_size = to_a.size
    return self if num > collection_size

    self[0...(collection_size - num)]
  end

  def drop_last_if
    dropping = true
    reverse_each.with_object([]) do |val, arr|
      next if dropping &&= yield(val)

      arr.unshift(val)
    end
  end

  def exactly?(num)
    found_count = 0

    if block_given?
      each { |*opt| found_count += 1 if yield(*opt) }
    else
      each { |opt| found_count += 1 if opt }
    end

    found_count > num ? false : num == found_count
  end

  # rubocop:disable Style/CaseEquality
  def excase?(object)
    none? { |val| object === val }
  end
  # rubocop:enable Style/CaseEquality

  def exclude?(object)
    !include?(object)
  end

  def expand
    map { |val| val.is_a?(Enumerable) ? val.expand : val }
  end

  def exponential(identity = 0, &block)
    if block_given?
      map(&block).exponential(identity)
    else
      inject { |key, val| key**val } || identity
    end
  end

  # rubocop:disable Style/CaseEquality
  def incase?(object)
    any? { |val| object === val }
  end
  # rubocop:enable Style/CaseEquality

  # rubocop:disable Metrics/MethodLength
  def interpose(sep, &block)
    enum = Enumerator.new do |val|
      items = each

      loop do
        begin
          val << items.next
        rescue StopIteration
          break
        end

        begin
          items.peek
        rescue StopIteration
          break
        else
          val << sep
        end
      end
    end

    block ? enum.each(&block) : enum
  end
  # rubocop:enable Metrics/MethodLength

  def many?
    found_count = 0

    if block_given?
      any? do |val|
        found_count += 1 if yield(val)
        found_count > 1
      end
    else
      any? { (found_count += 1) > 1 }
    end
  end

  def occurrences
    each_with_object(Hash.new(0)) { |key, hsh| hsh[key] += 1 }
  end

  def product(identity = 0, &block)
    if block_given?
      map(&block).product(identity)
    else
      inject { |key, val| key * val } || identity
    end
  end

  def quotient(identity = 0, &block)
    if block_given?
      map(&block).quotient(identity)
    else
      inject { |key, val| key / val } || identity
    end
  end

  def several?
    found_count = 0

    if block_given?
      each { |*opt| found_count += 1 if yield(*opt) }
    else
      each { |opt| found_count += 1 if opt }
    end

    found_count > 1
  end

  def take_last(num)
    collection_size = to_a.size
    return self if num > collection_size

    self[(collection_size - num)..-1]
  end

  def take_last_if
    reverse_each.with_object([]) do |val, arr|
      break arr unless yield(val)

      arr.unshift(val)
    end
  end

end
