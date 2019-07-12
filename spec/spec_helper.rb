# frozen_string_literal: true

require 'bundler/setup'
require 'lite/ruby'
require 'generator_spec'

Lite::Ruby.configure do |config|
  config.array = true
  config.date = true
  config.enumerable = true
  config.hash = true
  config.integer = true
  config.kernel = true
  config.numeric = true
  config.object = true
  config.range = true
  config.string = true
  config.time = true
end

spec_path = Pathname.new(File.expand_path('../spec', File.dirname(__FILE__)))

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.after(:all) do
    temp_path = spec_path.join('generators/lite/tmp')
    FileUtils.remove_dir(temp_path) if File.directory?(temp_path)
  end
end
