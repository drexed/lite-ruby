# frozen_string_literal: true

if Lite::Ruby.configuration.monkey_patches.include?('boolean')
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
end
