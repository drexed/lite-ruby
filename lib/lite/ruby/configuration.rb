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

    def self.configuration
      @configuration ||= Configuration.new
    end

    def self.configuration=(config)
      @configuration = config
    end

    def self.configure
      yield(configuration)
    end

  end
end
