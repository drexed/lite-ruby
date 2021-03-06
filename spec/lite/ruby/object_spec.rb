# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Object do

  describe '#array?' do
    it 'to be true' do
      expect([].array?).to eq(true)
    end

    it 'to be false' do
      expect(1.array?).to eq(false)
    end
  end

  describe '#blank?' do
    it 'to be true' do
      expect(''.blank?).to eq(true)
      expect(' '.blank?).to eq(true)
      expect([].blank?).to eq(true)
      expect({}.blank?).to eq(true)
      expect(false.blank?).to eq(true)
    end

    it 'to be false' do
      expect('x'.blank?).to eq(false)
      expect('foo bar'.blank?).to eq(false)
      expect('19'.blank?).to eq(false)
      expect(true.blank?).to eq(false)
    end
  end

  describe '#bool?' do
    it 'to be true' do
      expect(false.bool?).to eq(true)
      expect(true.bool?).to eq(true)
    end

    it 'to be false' do
      expect(0.bool?).to eq(false)
      expect('true'.bool?).to eq(false)
    end
  end

  describe '#boolean?' do
    it 'to be true' do
      expect(false.boolean?).to eq(true)
      expect(true.boolean?).to eq(true)
      expect(0.boolean?).to eq(true)
      expect(1.boolean?).to eq(true)
    end

    it 'to be false' do
      expect('foo'.boolean?).to eq(false)
    end
  end

  describe '#date?' do
    it 'to be true' do
      expect(Date.today.date?).to eq(true)
    end

    it 'to be false' do
      expect(1.date?).to eq(false)
    end
  end

  describe '#deep_dup' do
    it 'to be properly set vars on diff objects' do
      o1 = described_class.new
      o2 = o1.deep_dup
      o2.instance_variable_set(:@a, 1)

      expect(o1.instance_variable_defined?(:@a)).to eq(false)
      expect(o2.instance_variable_defined?(:@a)).to eq(true)
    end
  end

  describe '#false?' do
    it 'to be true' do
      expect(false.false?).to eq(true)
    end

    it 'to be false' do
      expect(true.false?).to eq(false)
    end
  end

  describe '#falsey?' do
    it 'to be true' do
      expect(false.falsey?).to eq(true)
      expect(nil.falsey?).to eq(true)
      expect(0.falsey?).to eq(true)
    end

    it 'to be false' do
      expect(true.false?).to eq(false)
      expect(1.false?).to eq(false)
    end
  end

  describe '#float?' do
    it 'to be true' do
      expect(1.0.float?).to eq(true)
      expect(-1.0.float?).to eq(true)
    end

    it 'to be false' do
      expect(1.float?).to eq(false)
    end
  end

  describe '#hash?' do
    it 'to be true' do
      expect({}.hash?).to eq(true)
    end

    it 'to be false' do
      expect(1.hash?).to eq(false)
    end
  end

  describe '#integer?' do
    it 'to be true' do
      expect(1.integer?).to eq(true)
      expect(-1.integer?).to eq(true)
    end

    it 'to be false' do
      expect('1'.integer?).to eq(false)
      expect(1.0.integer?).to eq(false)
    end
  end

  describe '#is_any?' do
    it 'to be true' do
      expect(1.is_any?(String, Integer)).to eq(true)
    end

    it 'to be false' do
      expect(0.is_any?(String, Symbol)).to eq(false)
    end
  end

  describe '#numeric?' do
    it 'to be true' do
      expect(1.numeric?).to eq(true)
      expect(-1.numeric?).to eq(true)
      expect(1.0.numeric?).to eq(true)
    end

    it 'to be false' do
      expect('1'.numeric?).to eq(false)
    end
  end

  describe '#numeral?' do
    it 'to be true' do
      expect(5.numeral?).to eq(true)
      expect(0.numeral?).to eq(true)
      expect(-37.3.numeral?).to eq(true)
      expect(51.45.numeral?).to eq(true)
      expect('+256.375'.numeral?).to eq(true)
      expect('-37.3'.numeral?).to eq(true)
    end

    it 'to be false' do
      expect(''.numeral?).to eq(false)
      expect(' '.numeral?).to eq(false)
      expect('2.3.3'.numeral?).to eq(false)
      expect('$9.86'.numeral?).to eq(false)
      expect('x'.numeral?).to eq(false)
      expect('foo'.numeral?).to eq(false)
    end
  end

  describe '#open_struct?' do
    it 'to be true' do
      s1 = OpenStruct.new

      expect(s1.open_struct?).to eq(true)
    end

    it 'to be false' do
      expect(1.open_struct?).to eq(false)
    end
  end

  describe '#palindrome?' do
    it 'to be true' do
      expect('racecar'.palindrome?).to eq(true)
      expect(12_321.palindrome?).to eq(true)
    end

    it 'to be false' do
      expect('example'.palindrome?).to eq(false)
      expect(12_345.palindrome?).to eq(false)
    end
  end

  describe '#present?' do
    it 'to be true' do
      expect('x'.present?).to eq(true)
      expect('foo bar'.present?).to eq(true)
      expect('19'.present?).to eq(true)
      expect(true.present?).to eq(true)
    end

    it 'to be false' do
      expect(''.present?).to eq(false)
      expect([].present?).to eq(false)
      expect({}.present?).to eq(false)
      expect(false.present?).to eq(false)
    end
  end

  describe '#presence' do
    it 'to be "foo"' do
      expect(nil.presence || 'foo').to eq('foo')
    end

    it 'to be "bar"' do
      expect('bar'.presence || 'foo').to eq('bar')
    end
  end

  describe '#range?' do
    it 'to be true' do
      expect((1..2).range?).to eq(true)
    end

    it 'to be false' do
      expect(1.range?).to eq(false)
    end
  end

  describe '#safe_call' do
    it 'to be nil' do
      callr = 3

      expect(callr.safe_call).to eq(3)
    end

    it 'to be 9' do
      callr = -> { 3 * 3 }

      expect(callr.safe_call).to eq(9)
    end

    it 'to be 12' do
      callr = ->(x, y) { 3 * (x + y) }

      expect(callr.safe_call(2, 2)).to eq(12)
    end

    it 'to raise error' do
      callr = ->(x, y) { 3 * (x + y) }

      expect { callr.safe_call(2) }.to raise_error(ArgumentError)
    end
  end

  describe '#safe_send' do
    let(:n1) { 3 }

    it 'to be 3' do
      expect(n1.safe_send(:fake)).to eq(n1)
    end

    it 'to be "3"' do
      expect(n1.safe_send(:to_s)).to eq('3')
    end

    it 'to be "5"' do
      expect(n1.safe_send(:+, 2)).to eq(5)
    end
  end

  describe '#safe_try' do
    let(:s1) { 'example' }

    it 'to be "example"' do
      expect(s1.safe_try(:fake_method)).to eq(s1)
    end

    it 'to be "EXAMPLE"' do
      expect(s1.safe_try(:upcase)).to eq('EXAMPLE')
    end
  end

  describe '#salvage' do
    it 'to be "---"' do
      s1 = '---'

      expect(false.salvage).to eq(s1)
      expect(''.salvage).to eq(s1)
      expect(' '.salvage).to eq(s1)
      expect(nil.salvage).to eq(s1)
    end

    it 'to be "bar"' do
      expect(' '.salvage('bar')).to eq('bar')
    end

    it 'to be "foo"' do
      s1 = 'foo'

      expect(s1.salvage).to eq(s1)
    end

    it 'to be 12' do
      n1 = 12

      expect(n1.salvage).to eq(n1)
    end
  end

  describe '#salvage_try' do
    let(:s1) { 'example' }

    it 'to be "---"' do
      expect(s1.salvage_try(:fake_method)).to eq('---')
    end

    it 'to be "X"' do
      expect(s1.salvage_try(:fake_method, placeholder: 'X')).to eq('X')
    end

    it 'to be "EXAMPLE"' do
      expect(s1.salvage_try(:upcase)).to eq('EXAMPLE')
    end
  end

  describe '#send_chain' do
    let(:n1) { 3 }

    it 'to be 6' do
      expect(n1.send_chain(:factorial)).to eq(6)
    end

    it 'to be 7' do
      expect(n1.send_chain([:add, 4])).to eq(7)
    end

    it 'to be 11' do
      expect(n1.send_chain(:factorial, [:add, 5])).to eq(11)
    end
  end

  describe '#send_chain_if' do
    let(:n1) { 3 }

    it 'to be 3' do
      expect(n1.send_chain_if(:test)).to eq(n1)
    end

    it 'to be 6' do
      expect(n1.send_chain_if(:factorial)).to eq(6)
    end

    it 'to be 7' do
      expect(n1.send_chain_if([:add, 4])).to eq(7)
    end

    it 'to be 11' do
      expect(n1.send_chain_if(:factorial, [:add, 5], :test)).to eq(11)
    end
  end

  describe '#send_if' do
    let(:n1) { 3 }

    it 'to be 3' do
      expect(n1.send_if(:test)).to eq(n1)
    end

    it 'to be 6' do
      expect(n1.send_if(:factorial)).to eq(6)
    end

    it 'to be 7' do
      expect(n1.send_if(:add, 4)).to eq(7)
    end
  end

  describe '#set?' do
    it 'to be true' do
      s1 = Set[1, 2]

      expect(s1.set?).to eq(true)
    end

    it 'to be false' do
      expect(1.set?).to eq(false)
    end
  end

  describe '#string?' do
    it 'to be true' do
      expect('foo'.string?).to eq(true)
    end

    it 'to be false' do
      expect(1.string?).to eq(false)
    end
  end

  describe '#struct?' do
    it 'to be true' do
      s1 = Struct.new(:name)

      expect(s1.new('test').struct?).to eq(true)
    end

    it 'to be false' do
      expect(1.struct?).to eq(false)
    end
  end

  describe '#symbol?' do
    it 'to be true' do
      expect(:foo.symbol?).to eq(true)
    end

    it 'to be false' do
      expect(1.symbol?).to eq(false)
    end
  end

  describe '#time?' do
    it 'to be true' do
      expect(Time.now.time?).to eq(true)
    end

    it 'to be false' do
      expect(1.time?).to eq(false)
    end
  end

  describe '#to_bool' do
    it 'to be true' do
      expect(true.to_bool).to eq(true)
      expect('Yes'.to_bool).to eq(true)
    end

    it 'to be false' do
      expect(0.to_bool).to eq(false)
      expect('Off'.to_bool).to eq(false)
    end
  end

  describe '#true?' do
    it 'to be true' do
      expect(true.true?).to eq(true)
    end

    it 'to be false' do
      expect(false.true?).to eq(false)
    end
  end

  describe '#truthy?' do
    it 'to be true' do
      expect(true.truthy?).to eq(true)
      expect(1.truthy?).to eq(true)
    end

    it 'to be false' do
      expect(false.truthy?).to eq(false)
      expect(nil.truthy?).to eq(false)
      expect(0.truthy?).to eq(false)
    end
  end

  describe '#try(!)' do
    let(:s1) { 'example' }

    it 'to be nil' do
      expect(s1.try(:fake_method)).to eq(nil)
    end

    it 'to be upcase' do
      expect(s1.try(:upcase)).to eq('EXAMPLE')
    end

    it 'to raise error' do
      expect { s1.try!(:fake_method) }.to raise_error(NoMethodError)
    end
  end

  describe '#try_call' do
    it 'to be nil' do
      callr = 3

      expect(callr.try_call).to eq(nil)
    end

    it 'to be 9' do
      callr = -> { 3 * 3 }

      expect(callr.try_call).to eq(9)
    end

    it 'to be 12' do
      callr = ->(x, y) { 3 * (x + y) }

      expect(callr.try_call(2, 2)).to eq(12)
    end

    it 'to raise error' do
      callr = ->(x, y) { 3 * (x + y) }

      expect { callr.try_call(2) }.to raise_error(ArgumentError)
    end
  end

  describe '#try_send' do
    let(:n1) { 3 }

    it 'to be nil' do
      expect(n1.try_send(:fake)).to eq(nil)
    end

    it 'to be "3"' do
      expect(n1.try_send(:to_s)).to eq('3')
    end

    it 'to be "5"' do
      expect(n1.try_send(:+, 2)).to eq(5)
    end
  end

end
