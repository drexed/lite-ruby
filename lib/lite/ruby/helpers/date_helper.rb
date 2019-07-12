# frozen_string_literal: true

module Lite
  module Ruby
    module DateHelper

      def format(string)
        delimiters = string.scan(/\W+/)
        formatters = string.scan(/[a-z0-9_]+/i)
        units = self.class::STRING_UNITS
        string = formatters.map { |key| "%#{units.fetch(key.to_sym)}#{delimiters.shift}" }
        strftime(string.join)
      end

      def to_format(key = :date_iso)
        units = self.class::KEY_UNITS
        strftime(units.fetch(key.to_sym))
      end

      alias_method :stamp, :to_format

    end
  end
end
