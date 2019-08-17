# frozen_string_literal: true

if Lite::Ruby.configuration.monkey_patches.include?('kernel')
  module Kernel

    # rubocop:disable Lint/RescueException, Security/Eval
    def safe_eval
      eval(self)
    rescue Exception
      self
    end

    def try_eval
      val = /\[\d*,?\d*,?\d*\]/.match(to_s).to_s
      return val if val.nil?

      eval(val)
    end
    # rubocop:enable Lint/RescueException, Security/Eval

    private

    def caller_name(depth = 0)
      val = caller[depth][/`([^']*)'/, 1]
      return val if depth.zero? || !val.include?('<top (required)>')

      caller[depth - 1][/`([^']*)'/, 1]
    end

  end
end
