# frozen_string_literal: true

class Range

  def overlaps?(other)
    cover?(other.first) || other.cover?(first)
  end

end
