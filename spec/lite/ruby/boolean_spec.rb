# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'Boolean' do
  let(:b1) { true }
  let(:b2) { false }

  describe '#to_i' do
    it 'to be 1' do
      expect(true.to_i).to eq(1)
    end

    it 'to be 0' do
      expect(false.to_i).to eq(0)
    end
  end

  describe '#to_bool' do
    it 'to be true' do
      expect(true.to_bool).to eq(true)
    end

    it 'to be false' do
      expect(false.to_bool).to eq(false)
    end
  end

end
