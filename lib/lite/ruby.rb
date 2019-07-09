# frozen_string_literal: true

%w[
  version configuration kernel array date enumerable hash integer numeric object range string time
].each do |file_name|
  require "lite/ruby/#{file_name}"
end

require 'generators/lite/ruby/install_generator'
