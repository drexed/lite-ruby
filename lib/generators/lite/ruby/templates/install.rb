# frozen_string_literal: true

Lite::Ruby.configure do |config|
  config.monkey_patches = %w[
    array boolean date enumerable hash integer kernel numeric object open_struct range string
    struct time
  ]
end
