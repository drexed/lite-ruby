# frozen_string_literal: true

module Kernel

  SANITIZE_EVAL_REGEXP ||= /\[\d*,?\d*,?\d*\]/.freeze
  CALLER_METHOD_REGEXP ||= /`([^']*)'/.freeze

  # rubocop:disable Lint/RescueException, Security/Eval
  unless defined?(safe_eval)
    def safe_eval
      eval(self)
    rescue Exception
      self
    end
  end

  unless defined?(try_eval)
    def try_eval
      val = SANITIZE_EVAL_REGEXP.match(to_s).to_s
      return val if val.nil?

      eval(val)
    end
  end
  # rubocop:enable Lint/RescueException, Security/Eval

  private

  unless defined?(caller_name)
    def caller_name(depth = 0)
      val = caller[depth][CALLER_METHOD_REGEXP, 1]
      return val if depth.zero? || !val.include?('<top (required)>')

      caller[depth - 1][CALLER_METHOD_REGEXP, 1]
    end
  end

end
