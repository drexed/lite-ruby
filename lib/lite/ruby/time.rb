# frozen_string_literal: true

if Lite::Ruby.configuration.monkey_patches.include?('time')
  class Time

    include Lite::Ruby::DateHelper
    include Lite::Ruby::TimeHelper

    class << self

      def elapse(verbose: false)
        started_at = monotonic
        yield
        ended_at = monotonic
        runtime = ended_at - started_at
        return runtime unless verbose

        { started_at: started_at, ended_at: ended_at, runtime: runtime }
      end

      def monotonic
        Process.clock_gettime(Process::CLOCK_MONOTONIC)
      end

    end

    private

    def default_format
      'year-month-day hour:minute'
    end

    def default_stamp
      :datetime_iso
    end

    def format_for(key)
      TIME_UNITS[key] || DATE_UNITS[key]
    end

    def stamp_for(key)
      TIME_STAMPS[key] || DATE_STAMPS[key]
    end

  end
end
