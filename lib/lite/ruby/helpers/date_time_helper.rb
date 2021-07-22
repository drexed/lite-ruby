# frozen_string_literal: true

module Lite
  module Ruby
    module DateTimeHelper

      def format(string = nil)
        string ||= self.class::DEFAULT_UNIT
        delimiters = string.scan(/\W+/)
        formatters = string.scan(/[a-z0-9_]+/i)
        string = formatters.map { |key| "%#{self.class::UNITS[key.to_s]}#{delimiters.shift}" }
        strftime(string.join)
      end

      def stamp(key = nil)
        key = key.nil? ? self.class::DEFAULT_STAMP : key.to_s
        strftime(self.class::STAMPS[key])
      end

      alias to_format stamp

    end
  end
end
