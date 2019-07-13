# frozen_string_literal: true

%w[version configuration].each do |filename|
  require "lite/ruby/#{filename}"
end

%w[date time].each do |filename|
  require "lite/ruby/helpers/#{filename}_helper"
end

Lite::Ruby.configuration.monkey_patches.each do |filename|
  require "lite/ruby/#{filename}"
end

require 'generators/lite/ruby/install_generator'
