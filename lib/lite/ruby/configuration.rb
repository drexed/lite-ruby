# frozen_string_literal: true

module Lite
  module Ruby

    class Configuration

      attr_accessor :monkey_patches

      def initialize
        @monkey_patches = %w[
          array boolean date enumerable hash integer kernel numeric object open_struct range string
          struct time
        ]
      end

    end

    class << self

      attr_writer :configuration

      def configuration
        @configuration ||= Configuration.new
      end

      def configure
        yield(configuration)
      end

      def reset_configuration!
        @configuration = Configuration.new
      end

    end

  end
end
