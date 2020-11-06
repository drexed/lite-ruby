# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Integer do

  describe '#bit' do
    it 'to be 16' do
      expect(0.bit(4)).to eq(16)
    end

    it 'to be 2' do
      expect(10.bit(-4)).to eq(2)
    end

    it 'to be 0' do
      expect(0b0100.bit(-3)).to eq(0)
    end
  end

  describe '#bit?' do
    it 'to be true' do
      expect(8.bit?(3)).to eq(true)
    end

    it 'to be false' do
      expect(8.bit?(2)).to eq(false)
    end
  end

  describe '#bit_clear' do
    it 'to be 0' do
      expect(4.bit_clear(2)).to eq(0)
    end
  end

  describe '#bitmask' do
    it 'to be 7' do
      expect(1.bitmask(6)).to eq(7)
    end

    it 'to be 5' do
      expect(7.bitmask(~2)).to eq(5)
    end
  end

  describe '#bitmask?' do
    it 'to be true' do
      expect(7.bitmask?(7)).to eq(true)
    end

    it 'to be false' do
      expect(8.bitmask?(3)).to eq(false)
    end
  end

  describe '#combinatorial' do
    it 'to be 50' do
      expect(50.combinatorial(49)).to eq(50)
    end

    it 'to be 1' do
      expect(50.combinatorial(50)).to eq(1)
    end

    it 'to be 70' do
      expect(8.combinatorial(4)).to eq(70)
    end
  end

  describe '#factorial' do
    it 'to be 0' do
      expect(0.factorial).to eq(0)
    end

    it 'to be 1' do
      expect(1.factorial).to eq(1)
    end

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
      expect(3.to_time).to be_a(Time)
    end
  end

end
