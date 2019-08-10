# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Lite::Ruby::Configuration do
  after do
    Lite::Ruby.configure do |config|
      config.monkey_patches = %w[
        array boolean date enumerable hash integer kernel numeric object open_struct range string
        struct time
      ]
    end
  end

  describe '#configure' do
    it 'to be "foo"' do
      Lite::Ruby.configuration.monkey_patches = 'foo'

      expect(Lite::Ruby.configuration.monkey_patches).to eq('foo')
    end
  end

end
