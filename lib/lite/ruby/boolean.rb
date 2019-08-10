# frozen_string_literal: true

class FalseClass

  def to_bool
    self
  end

  alias to_b to_bool

  def to_i
    0
  end

end

class TrueClass

  def to_bool
    self
  end

  alias to_b to_bool

  def to_i
    1
  end

end
