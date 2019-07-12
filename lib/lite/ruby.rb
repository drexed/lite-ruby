# frozen_string_literal: true

require 'lite/ruby/version'
require 'lite/ruby/configuration'

%w[date time].each do |filename|
  require "lite/ruby/helpers/#{filename}_helper"
end

%w[array date enumerable hash integer kernel numeric object range string time].each do |filename|
  next unless Lite::Ruby.configuration.send(filename)

  require "lite/ruby/#{filename}"
end

require 'generators/lite/ruby/install_generator'
