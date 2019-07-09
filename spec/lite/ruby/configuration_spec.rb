# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Lite::Ruby::Configuration do
  after(:all) do
    Lite::Ruby.configure do |config|
      config.autoload_array = true
    end
  end

  describe '#configure' do
    it 'to be "foo"' do
      Lite::Ruby.configuration.autoload_array = 'foo'

      expect(Lite::Ruby.configuration.autoload_array).to eq('foo')
    end
  end

end
