# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Range do

  describe '#bounds' do
    it 'to be [1, 6]' do
      expect((1..6).bounds).to eq([1, 6])
    end
  end

  describe '#combine' do
    it 'to be [1, 2, 3, 4, 5, 6]' do
      expect((1..3).combine(4..6)).to eq([1, 2, 3, 4, 5, 6])
    end
  end

  describe '#include_with_range?' do
    let(:r1) { (1..5) }

    it 'to be true' do
      expect(r1.include_with_range?(1)).to eq(true)
      expect(r1.include_with_range?(2..3)).to eq(true)
    end

    it 'to be false' do
      expect(r1.include_with_range?(7)).to eq(false)
      expect(r1.include_with_range?(2..6)).to eq(false)
    end
  end

  describe '#overlaps?' do
    let(:r1) { (1..5) }

    it 'to be true' do
      expect(r1.overlaps?(4..6)).to eq(true)
    end

    it 'to be false' do
      expect(r1.overlaps?(7..9)).to eq(false)
    end
  end

  describe '#sample' do
    let(:a1) { [1, 2, 3, 4, 5] }

    it 'to be true' do
      expect(a1.include?((1..5).sample)).to eq(true)
    end

    it 'to be false' do
      expect(a1.include?((6..9).sample)).to eq(false)
    end
  end

  describe '#shuffle' do
    it 'to not be [1, 2, 3, 4, 5]' do
      expect((1..5).shuffle).not_to eq([1, 2, 3, 4, 5])
    end
  end

  describe '#within?' do
    let(:r1) { (1..5) }

    it 'to be true' do
      expect(r1.within?(2..4)).to eq(true)
      expect(r1.within?(2..5)).to eq(true)
    end

    it 'to be false' do
      expect(r1.within?(2..6)).to eq(false)
      expect(r1.within?(0..6)).to eq(false)
    end
  end

end
