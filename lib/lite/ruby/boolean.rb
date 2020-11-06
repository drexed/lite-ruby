# frozen_string_literal: true

if Lite::Ruby.configuration.monkey_patches.include?('boolean')
  class FalseClass

    def to_bool
      self
    end

    def to_i
      0
    end

    alias to_b to_bool

  end

  class TrueClass

    def to_bool
      self
    end

    def to_i
      1
    end

    alias to_b to_bool

  end
end
