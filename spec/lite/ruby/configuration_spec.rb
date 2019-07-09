# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Lite::Ruby::Configuration do
  after do
    Lite::Ruby.configure do |config|
      config.array = true
    end
  end

  describe '#configure' do
    it 'to be "foo"' do
      Lite::Ruby.configuration.array = 'foo'

      expect(Lite::Ruby.configuration.array).to eq('foo')
    end
  end

end
