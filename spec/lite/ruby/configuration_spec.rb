# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Lite::Ruby::Configuration do
  after { Lite::Ruby.reset_configuration! }

  describe '#configure' do
    it 'to be "foo"' do
      Lite::Ruby.configuration.monkey_patches = 'foo'

      expect(Lite::Ruby.configuration.monkey_patches).to eq('foo')
    end
  end

  describe '#reset_configuration!' do
    it 'to be true' do
      Lite::Ruby.configuration.monkey_patches = 'foo'
      Lite::Ruby.reset_configuration!

      expect(Lite::Ruby.configuration.monkey_patches.is_a?(Array)).to eq(true)
    end
  end

end
