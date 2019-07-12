# frozen_string_literal: true

module Lite
  module Ruby

    class Configuration

      attr_accessor :array, :date, :enumerable, :hash, :integer, :kernel, :numeric, :object, :range,
                    :string, :struct, :time

      # rubocop:disable Metrics/MethodLength
      def initialize
        @array = true
        @date = true
        @enumerable = true
        @hash = true
        @integer = true
        @kernel = true
        @numeric = true
        @object = true
        @range = true
        @string = true
        @struct = true
        @time = true
      end
      # rubocop:enable Metrics/MethodLength

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
