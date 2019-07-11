# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Enumerable do

  describe '#cluster' do
    it 'to be [[2, 2, 2], [3, 3], [4], [2, 2], [1]]' do
      array = [2, 2, 2, 3, 3, 4, 2, 2, 1]

      expect(array.cluster { |x| x }).to eq([[2, 2, 2], [3, 3], [4], [2, 2], [1]])
    end
  end

  describe '#deduce' do
    it 'to be 0' do
      expect([].deduce).to eq(0)
    end

    it 'to be nil' do
      expect([].deduce(nil)).to eq(nil)
    end

    it 'to be -4' do
      expect([1, 2, 3].deduce).to eq(-4)
    end
  end

  describe '#divisible' do
    it 'to be 0' do
      expect([].divisible).to eq(0)
    end

    it 'to be nil' do
      expect([].divisible(nil)).to eq(nil)
    end

    it 'to be 2' do
      expect([16, 4, 2].divisible).to eq(2)
    end
  end

  describe '#drop_last' do
    it 'to be []' do
      expect([].drop_last(1)).to eq([])
    end

    it 'to be [1, 2]' do
      expect([1, 2, 3].drop_last(1)).to eq([1, 2])
    end

    it 'to be [1]' do
      expect([1, 2, 3].drop_last(2)).to eq([1])
    end
  end

  describe '#drop_last_if' do
    it 'to be []' do
      expect([].take_last_if(&:odd?)).to eq([])
    end

    it 'to be [1, 2]' do
      expect([1, 2, 3].drop_last_if(&:odd?)).to eq([1, 2])
    end

    it 'to be [1, 2, 3, 4]' do
      expect([1, 2, 3, 4].drop_last_if(&:odd?)).to eq([1, 2, 3, 4])
    end
  end

  describe '#exactly?' do
    it 'to be true' do
      expect([1, false, nil].exactly?(1)).to eq(true)
      expect([false, nil].exactly?(0)).to eq(true)
      expect([1, 2, 3].exactly?(3)).to eq(true)
      expect([1, 2, 3, 4].exactly?(1) { |n| n > 3 }).to eq(true)
      expect([1, 2, 3, 4].exactly?(2, &:even?)).to eq(true)
    end

    it 'to be false' do
      expect([].exactly?(1)).to eq(false)
      expect([1, false, nil].exactly?(3)).to eq(false)
      expect([1, 1, 3, 3].exactly?(2, &:even?)).to eq(false)
    end
  end

  describe '#excase?' do
    it 'to be true' do
      expect([1, 2, 'a'].excase?(3)).to eq(true)
    end

    it 'to be false' do
      expect([1, 2, 'a'].excase?(2)).to eq(false)
      expect([1, 2, 'a'].excase?(String)).to eq(false)
    end
  end

  describe '#exclude?' do
    it 'to be true' do
      expect([1, 2, 3].exclude?(4)).to eq(true)
    end

    it 'to be false' do
      expect([1, 2, 3].exclude?(3)).to eq(false)
    end
  end

  describe '#expand' do
    it 'to be [0, [2, 3], [5, 6, 7]]' do
      expect([0, 2..3, 5..7].expand).to eq([0, [2, 3], [5, 6, 7]])
    end
  end

  describe '#exponential' do
    it 'to be 0' do
      expect([].exponential).to eq(0)
    end

    it 'to be nil' do
      expect([].exponential(nil)).to eq(nil)
    end

    it 'to be 4096' do
      expect([2, 3, 4].exponential).to eq(4096)
    end
  end

  describe '#incase?' do
    it 'to be true' do
      expect([1, 2, 'a'].incase?(2)).to eq(true)
      expect([1, 2, 'a'].incase?(String)).to eq(true)
    end

    it 'to be false' do
      expect([1, 2, 'a'].incase?(3)).to eq(false)
    end
  end

  describe '#interpose' do
    it 'to be [1, :sep, 2, :sep, "a"]' do
      expect([1, 2, 'a'].interpose(:sep).to_a).to eq([1, :sep, 2, :sep, 'a'])
    end
  end

  describe '#many?' do
    it 'to be true' do
      expect([1, 2, 3].many?).to eq(true)
      expect([1, false, nil].many?).to eq(true)
      expect([1, 2, 3, 4].many?(&:even?)).to eq(true)
    end

    it 'to be false' do
      expect([].many?).to eq(false)
      expect([1, 1, 3, 3].many?(&:even?)).to eq(false)
    end
  end

  describe '#multiple' do
    it 'to be 0' do
      expect([].multiple).to eq(0)
    end

    it 'to be nil' do
      expect([].multiple(nil)).to eq(nil)
    end

    it 'to be 6' do
      expect([1, 2, 3].multiple).to eq(6)
    end
  end

  describe '#occurrences' do
    it 'to be {}' do
      expect([].occurrences).to eq({})
    end

    it 'to be { 1 => 2, :symbol => 2, "string" => 1, 3 => 1 }' do
      array = [1, :symbol, 'string', 3, :symbol, 1]

      expect(array.occurrences).to eq(1 => 2, :symbol => 2, 'string' => 1, 3 => 1)
    end
  end

  describe '#several?' do
    it 'to be true' do
      expect([1, 2, 3].several?).to eq(true)
      expect([1, 2, 3, 4].several?(&:even?)).to eq(true)
    end

    it 'to be false' do
      expect([].several?).to eq(false)
      expect([1, false, nil].several?).to eq(false)
      expect([1, 1, 3, 3].several?(&:even?)).to eq(false)
    end
  end

  describe '#take_last' do
    it 'to be []' do
      expect([].take_last(3)).to eq([])
    end

    it 'to be [3]' do
      expect([1, 2, 3].take_last(1)).to eq([3])
    end

    it 'to be [2, 3]' do
      expect([1, 2, 3].take_last(2)).to eq([2, 3])
    end
  end

  describe '#take_last_if' do
    it 'to be []' do
      expect([].take_last_if(&:odd?)).to eq([])
    end

    it 'to be [3]' do
      expect([1, 2, 3].take_last_if(&:odd?)).to eq([3])
    end

    it 'to be [1, 2, 3, 4]' do
      expect([1, 2, 3, 4].take_last_if(&:odd?)).to eq([])
    end
  end

end
