# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Integer do

  describe '#factorial' do
    it 'to be 24' do
      expect(4.factorial).to eq(24)
    end
  end

  describe '#factors' do
    it 'to be [1, 24, 2, 12, 3, 8, 4, 6]' do
      expect(24.factors).to eq([1, 24, 2, 12, 3, 8, 4, 6])
    end
  end

  describe '#of' do
    it 'to be [1, 2, 3]' do
      expect(3.of { |i| i + 1 }).to eq([1, 2, 3])
    end
  end

  describe '#roman_numeral' do
    it 'to be ""' do
      expect(0.roman_numeral).to eq('')
    end

    it 'to be "XLIX"' do
      expect(49.roman_numeral).to eq('XLIX')
    end

    it 'to be "-XLIX"' do
      expect(-8.roman_numeral).to eq('-VIII')
    end
  end

  describe '#to_time' do
    it 'to be "1969-12-31 19:00:03 -0500"' do
      expect(3.to_time.to_s).to be_a(String)
    end
  end

end
