# frozen_string_literal: true

if Lite::Ruby.configuration.monkey_patches.include?('enumerable')
  require 'lite/ruby/safe/enumerable' unless defined?(ActiveSupport)

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

    def cluster_by(&block)
      group_by(&block).sort.transpose.pop || []
    end

    def deduce(identity = 0, &block)
      if defined?(yield)
        map(&block).deduce(identity)
      else
        inject { |acc, val| acc - val } || identity
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

      if defined?(yield)
        each { |*opt| found_count += 1 if yield(*opt) }
      else
        each { |opt| found_count += 1 if opt }
      end

      found_count > num ? false : num == found_count
    end

    def excase?(object)
      none?(object)
    end

    def expand
      map { |val| val.is_a?(Enumerable) ? val.expand : val }
    end

    def exponential(identity = 0, &block)
      if defined?(yield)
        map(&block).exponential(identity)
      else
        inject { |acc, val| acc**val } || identity
      end
    end

    def frequency
      each_with_object(Hash.new(0)) { |val, hash| hash[val] += 1 }
    end

    def incase?(object)
      any?(object)
    end

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

    def modulate(modulo)
      if modulo == 1
        to_a
      elsif size % modulo != 0
        raise ArgumentError, "Invalid modulo: #{modulo.inspect}"
      else
        (0...size).each_with_object(Array.new(modulo, [])) do |i, array|
          array[i % modulo] += [self[i]]
        end
      end
    end

    # rubocop:disable Metrics/AbcSize, Metrics/CyclomaticComplexity
    # rubocop:disable Metrics/MethodLength, Metrics/PerceivedComplexity
    def occur(amount = nil)
      result = Hash.new { |hash, key| hash[key] = [] }

      each do |item|
        key = item
        result[key] << item
      end

      if defined?(yield)
        result.select! { |_key, values| yield(values.size) }
      else
        raise ArgumentError, 'Invalid occur amount' unless amount

        if amount.is_a?(Range)
          result.select! { |_key, values| amount.include?(values.size) }
        else
          result.select! { |_key, values| values.size == amount }
        end
      end

      result.values.flatten.uniq
    end
    # rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity
    # rubocop:enable Metrics/MethodLength, Metrics/PerceivedComplexity

    def produce(identity = 0, &block)
      if defined?(yield)
        map(&block).produce(identity)
      else
        inject { |acc, val| acc * val } || identity
      end
    end

    def quotient(identity = 0, &block)
      if defined?(yield)
        map(&block).quotient(identity)
      else
        inject { |acc, val| acc / val } || identity
      end
    end

    def several?
      found_count = 0

      if defined?(yield)
        each { |*opt| found_count += 1 if yield(*opt) }
      else
        each { |opt| found_count += 1 if opt }
      end

      found_count > 1
    end

    # rubocop:disable Metrics/MethodLength
    def squeeze(*limited_to)
      first = true
      current = nil

      each_with_object([]) do |val, array|
        if !limited_to.empty? && !limited_to.include?(val)
          array << val
        elsif first || current != val
          array << val
          first = false
          current = val
        end
      end
    end
    # rubocop:enable Metrics/MethodLength

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

    alias occurrences frequency

  end
end
