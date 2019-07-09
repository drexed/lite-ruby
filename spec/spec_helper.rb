# frozen_string_literal: true

require 'bundler/setup'
require 'lite/ruby'
require 'generator_spec'

spec_path = Pathname.new(File.expand_path('../spec', File.dirname(__FILE__)))

Lite::Ruby.configure do |config|
  config.autoload_array = true
  config.autoload_date = true
  config.autoload_enumerable = true
  config.autoload_hash = true
  config.autoload_integer = true
  config.autoload_kernel = true
  config.autoload_numeric = true
  config.autoload_object = true
  config.autoload_range = true
  config.autoload_string = true
  config.autoload_time = true
end

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
