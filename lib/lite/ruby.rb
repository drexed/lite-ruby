# frozen_string_literal: true

require 'generators/lite/ruby/install_generator' if defined?(Rails::Generators)

%w[version configuration].each do |filename|
  require "lite/ruby/#{filename}"
end

%w[date time].each do |filename|
  require "lite/ruby/helpers/#{filename}_helper"
end

%w[
  array boolean date enumerable hash integer kernel numeric object open_struct range string
  struct time
].each do |filename|
  require "lite/ruby/#{filename}"
end
