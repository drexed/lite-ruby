# frozen_string_literal: true

module Enumerable

  CRITICAL_ZSCORES ||= {
    3 => 1.15, 4 => 1.48, 5 => 1.71, 6 => 1.89, 7 => 2.02, 8 => 2.13, 9 => 2.21, 10 => 2.29,
    11 => 2.34, 12 => 2.41, 13 => 2.46, 14 => 2.51, 15 => 2.55, 16 => 2.59, 17 => 2.62, 18 => 2.65,
    19 => 2.68, 20 => 2.71, 21 => 2.73, 22 => 2.76, 23 => 2.78, 24 => 2.80, 25 => 2.82, 26 => 2.84,
    27 => 2.86, 28 => 2.88, 29 => 2.89, 30 => 2.91, 31 => 2.92, 32 => 2.94, 33 => 2.95, 34 => 2.97,
    35 => 2.98, 36 => 2.99, 37 => 3.00, 38 => 3.01, 39 => 3.03, 40 => 3.04, 50 => 3.13, 60 => 3.20,
    70 => 3.26, 80 => 3.31, 90 => 3.35, 100 => 3.38, 110 => 3.42, 120 => 3.44, 130 => 3.47,
    140 => 3.49
  }.freeze

  # rubocop:disable Lint/UnusedMethodArgument
  unless defined?(cluster)
    def cluster(&block)
      each_with_object([]) do |ele, results|
        last_res = results.last

        if last_res && (yield(ele) == yield(last_res.last))
          last_res << ele
        else
          results << [ele]
        end
      end
    end
  end
  # rubocop:enable Lint/UnusedMethodArgument

  unless defined?(critical_zscore)
    def critical_zscore(identity = nil)
      collection_size = size
      result = nil

      CRITICAL_ZSCORES.keys.sort.each do |key|
        break if key > collection_size

        result = CRITICAL_ZSCORES[key]
      end

      result || identity
    end
  end

  unless defined?(defference)
    def defference(identity = 0, &block)
      if block_given?
        map(&block).defference(identity)
      else
        inject { |key, val| key - val } || identity
      end
    end
  end

  unless defined?(divisible)
    def divisible(identity = 0, &block)
      if block_given?
        map(&block).divisible(identity)
      else
        inject { |key, val| key / val } || identity
      end
    end
  end

  unless defined?(drop_last)
    def drop_last(num)
      collection_size = to_a.size
      return self if num > collection_size

      self[0...(collection_size - num)]
    end
  end

  unless defined?(drop_last_if)
    def drop_last_if
      return to_enum(:drop_last_if) unless block_given?

      dropping = true
      reverse_each.with_object([]) do |val, arr|
        next if dropping &&= yield(val)

        arr.unshift(val)
      end
    end
  end

  unless defined?(exactly?)
    def exactly?(num)
      found_count = 0

      if block_given?
        each { |*opt| found_count += 1 if yield(*opt) }
      else
        each { |opt| found_count += 1 if opt }
      end

      found_count > num ? false : num == found_count
    end
  end

  unless defined?(exclude?)
    def exclude?(object)
      !include?(object)
    end
  end

  unless defined?(expand)
    def expand
      map { |val| val.is_a?(Enumerable) ? val.expand : val }
    end
  end

  unless defined?(exponential)
    def exponential(identity = 0, &block)
      if block_given?
        map(&block).exponential(identity)
      else
        inject { |key, val| key**val } || identity
      end
    end
  end

  # rubocop:disable Style/CaseEquality
  unless defined?(incase?)
    def incase?(object)
      any? { |val| object === val }
    end
  end
  # rubocop:enable Style/CaseEquality

  # rubocop:disable Metrics/MethodLength
  unless defined?(interpose)
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
  end
  # rubocop:enable Metrics/MethodLength

  unless defined?(many?)
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
  end

  unless defined?(mean)
    def mean(identity = 0)
      return identity if empty?

      sum / size.to_f
    end

    alias average mean
  end

  unless defined?(median)
    def median(identity = 0)
      collection_size = size.to_f
      collection_sorted = sort
      return identity unless collection_size > 0.0

      half_collection = collection_size / 2.0
      sorted_collection = collection_sorted[half_collection]
      return sorted_collection unless (collection_size % 2).zero?

      (collection_sorted[half_collection - 1.0] + sorted_collection) / 2.0
    end
  end

  # rubocop:disable Metrics/AbcSize, Metrics/LineLength
  unless defined?(mode)
    def mode(identity = nil)
      return identity unless size.positive?

      frequency_distribution = each_with_object(Hash.new(0)) { |val, hsh| hsh[val] += 1 }
      frequency_top_two = frequency_distribution.sort_by { |_, val| -val }.take(2)
      top_two_first = frequency_top_two.first
      return identity if frequency_top_two.size != 1 && top_two_first.last == frequency_top_two.last.last

      top_two_first.first
    end
  end
  # rubocop:enable Metrics/AbcSize, Metrics/LineLength

  unless defined?(multiple)
    def multiple(identity = 0, &block)
      if block_given?
        map(&block).multiple(identity)
      else
        inject { |key, val| key * val } || identity
      end
    end
  end

  unless defined?(occurrences)
    def occurrences
      each_with_object(Hash.new(0)) { |key, hsh| hsh[key] += 1 }
    end
  end

  # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
  unless defined?(percentile)
    def percentile(num, identity = 0)
      return identity unless size.positive?

      collection_sorted = sort
      index = (num.to_f / 100) * collection_sorted.size - 1

      if index != index.to_i
        collection_sorted[index.ceil] || identity
      elsif collection_sorted.size.even?
        sample_one = collection_sorted.at(index)
        sample_two = collection_sorted.at(index + 1)
        (sample_one + sample_two) / 2
      else
        collection_sorted[index] || identity
      end
    end
  end
  # rubocop:enable Metrics/AbcSize, Metrics/MethodLength

  unless defined?(range)
    def range(identity = 0)
      return identity unless size.positive?

      collection_sorted = sort
      collection_sorted.last - collection_sorted.first
    end
  end

  unless defined?(reject_outliers)
    def reject_outliers
      cz = critical_zscore
      reject { |value| zscore(value) > cz }
    end
  end

  unless defined?(reject_outliers!)
    def reject_outliers!
      replace(reject_outliers)
    end
  end

  unless defined?(select_outliers)
    def select_outliers
      cz = critical_zscore
      select { |value| zscore(value) > cz }
    end
  end

  unless defined?(select_outliers!)
    def select_outliers!
      replace(select_outliers)
    end
  end

  unless defined?(several?)
    def several?
      found_count = 0

      if block_given?
        each { |*opt| found_count += 1 if yield(*opt) }
      else
        each { |opt| found_count += 1 if opt }
      end

      found_count > 1
    end
  end

  unless defined?(standard_deviation)
    def standard_deviation(identity = 0)
      return identity if size < 2

      Math.sqrt(variance)
    end
  end

  unless defined?(sum)
    def sum(identity = 0, &block)
      if block_given?
        map(&block).sum(identity)
      else
        inject { |sum, val| sum + val } || identity
      end
    end
  end

  unless defined?(take_last)
    def take_last(num)
      collection_size = to_a.size
      return self if num > collection_size

      self[(collection_size - num)..-1]
    end
  end

  unless defined?(take_last_if)
    def take_last_if
      return to_enum(:take_last_if) unless block_given?

      reverse_each.with_object([]) do |val, arr|
        break arr unless yield(val)

        arr.unshift(val)
      end
    end
  end

  unless defined?(variance)
    def variance(identity = 0)
      collection_size = size
      return identity if collection_size <= 1

      total = inject(0.0) { |sum, val| sum + (val - mean)**2.0 }
      total / (collection_size - 1.0)
    end
  end

  unless defined?(zscore)
    def zscore(value)
      sd = standard_deviation
      return sd if sd.zero?

      (mean - value).abs / sd
    end
  end

end
