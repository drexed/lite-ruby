# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Enumerable do

  describe '#cluster' do
    it 'to be [[2, 2, 2], [3, 3], [4], [2, 2], [1]]' do
      a1 = [2, 2, 2, 3, 3, 4, 2, 2, 1]
      a2 = [[2, 2, 2], [3, 3], [4], [2, 2], [1]]

      expect(a1.cluster { |x| x }).to eq(a2)
    end
  end

  describe '#cluster_by' do
    it 'to be [[2, 2, 2], [3, 3], [4], [2, 2], [1]]' do
      a1 = %w[this is a test]
      a2 = [%w[a], %w[is], %w[this test]]

      expect(a1.cluster_by { |x| x[0] }).to eq(a2)
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

  describe '#drop_last' do
    let(:a1) { [1, 2, 3] }

    it 'to be []' do
      expect([].drop_last(1)).to eq([])
    end

    it 'to be [1, 2]' do
      expect(a1.drop_last(1)).to eq([1, 2])
    end

    it 'to be [1]' do
      expect(a1.drop_last(2)).to eq([1])
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
    let(:a1) { [1, 2, 'a'] }

    it 'to be true' do
      expect(a1.excase?(3)).to eq(true)
    end

    it 'to be false' do
      expect(a1.excase?(2)).to eq(false)
      expect(a1.excase?(String)).to eq(false)
    end
  end

  describe '#exclude?' do
    let(:a1) { [1, 2, 3] }

    it 'to be true' do
      expect(a1.exclude?(4)).to eq(true)
    end

    it 'to be false' do
      expect(a1.exclude?(3)).to eq(false)
    end
  end

  describe '#excluding' do
    it 'to be [1, 2]' do
      a1 = [1, 2, 3]

      expect(a1.excluding(2, 3)).to eq([1])
    end

    it 'to be { bar: 2 }' do
      h1 = { foo: 1, bar: 2, baz: 3 }

      expect(h1.excluding(:foo, :baz)).to eq(bar: 2)
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

  describe '#frequency' do
    it 'to be { a: 2, b: 1, c: 3 }' do
      a1 = %i[a a b c c c]
      h1 = { a: 2, b: 1, c: 3 }

      expect(a1.frequency).to eq(h1)
    end
  end

  describe '#incase?' do
    let(:a1) { [1, 2, 'a'] }

    it 'to be true' do
      expect(a1.incase?(2)).to eq(true)
      expect(a1.incase?(String)).to eq(true)
    end

    it 'to be false' do
      expect(a1.incase?(3)).to eq(false)
    end
  end

  describe '#including' do
    it 'to be [1, 2, 3, 4, 5]' do
      a1 = [1, 2, 3]

      expect(a1.including(4, 5)).to eq([1, 2, 3, 4, 5])
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

  describe '#modulate' do
    let(:a1) { [2] }

    it 'to be [2]' do
      expect(a1.modulate(1)).to eq(a1)
    end

    it 'to raise error' do
      expect { a1.modulate(2) }.to raise_error(ArgumentError)
    end

    it 'to be [[2, 6], [4, 8]]' do
      a1 = [2, 4, 6, 8]
      a2 = [[2, 6], [4, 8]]

      expect(a1.modulate(2)).to eq(a2)
    end
  end

  describe '#occur' do
    let(:a1) { [1, 1, 2, 3, 3, 4, 5, 5] }
    let(:a2) { [1, 3, 5] }

    it 'to be [1, 3, 5] for value' do
      expect(a1.occur(2)).to eq(a2)
    end

    it 'to be [1, 3, 5] for range' do
      expect(a1.occur(2..3)).to eq(a2)
    end

    it 'to be [1, 3, 5] for block' do
      expect(a1.occur { |n| n > 1 }).to eq(a2)
    end

    it 'to raise error' do
      expect { a1.occur }.to raise_error(ArgumentError)
    end
  end

  describe '#pick' do
    let(:a1) { [{ id: 1, name: 'a' }, { id: 2, name: 'b' }] }

    it 'to be [1, 2]' do
      expect(a1.pick(:id)).to eq(1)
    end

    it 'to be [[1, "a"], [2, "b"]]' do
      expect(a1.pick(:id, :name)).to eq([1, 'a'])
    end

    it 'to be nil' do
      expect(a1.pick(:fake)).to eq(nil)
    end
  end

  describe '#pluck' do
    let(:a1) { [{ id: 1, name: 'a' }, { id: 2, name: 'b' }] }

    it 'to be [1, 2]' do
      expect(a1.pluck(:id)).to eq([1, 2])
    end

    it 'to be [[1, "a"], [2, "b"]]' do
      expect(a1.pluck(:id, :name)).to eq([[1, 'a'], [2, 'b']])
    end

    it 'to be [nil, nil]' do
      expect(a1.pluck(:fake)).to eq([nil, nil])
    end
  end

  describe '#produce' do
    it 'to be 0' do
      expect([].produce).to eq(0)
    end

    it 'to be nil' do
      expect([].produce(nil)).to eq(nil)
    end

    it 'to be 6' do
      expect([1, 2, 3].produce).to eq(6)
    end
  end

  describe '#quotient' do
    it 'to be 0' do
      expect([].quotient).to eq(0)
    end

    it 'to be nil' do
      expect([].quotient(nil)).to eq(nil)
    end

    it 'to be 2' do
      expect([16, 4, 2].quotient).to eq(2)
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

  describe '#squeeze' do
    let(:a1) { [1, 2, 2, 3, 3, 2, 1] }

    it 'to be [1, 2, 3, 2, 1]' do
      expect(a1.squeeze).to eq([1, 2, 3, 2, 1])
    end

    it 'to be [1, 2, 3]' do
      expect(a1.sort.squeeze).to eq([1, 2, 3])
    end

    it 'to be [1, 2, 2, 3, 2, 1]' do
      expect(a1.squeeze(3)).to eq([1, 2, 2, 3, 2, 1])
    end
  end

  describe '#take_last' do
    let(:a1) { [1, 2, 3] }

    it 'to be []' do
      expect([].take_last(3)).to eq([])
    end

    it 'to be [3]' do
      expect(a1.take_last(1)).to eq([3])
    end

    it 'to be [2, 3]' do
      expect(a1.take_last(2)).to eq([2, 3])
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
