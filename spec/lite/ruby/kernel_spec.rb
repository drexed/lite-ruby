# frozen_string_literal: true

require 'spec_helper'

class Foo

  def level1
    caller_name
  end

  def level2
    level1
  end

  def level3
    level4
  end

  def level4
    caller_name(1)
  end

end

RSpec.describe Kernel do
  let(:klass) { Foo.new }

  describe '#safe_eval' do
    it 'to be [1,2,3]' do
      expect('[1,2,3]'.safe_eval).to eq([1, 2, 3])
    end

    it 'to be "[#1,2,3]"' do
      expect('[#1,2,3]'.safe_eval).to eq('[#1,2,3]')
    end

    it 'to be nil' do
      expect(nil.safe_eval).to eq(nil)
    end
  end

  describe '#try_eval' do
    it 'to be [1,2,3]' do
      expect('[1,2,3]'.try_eval).to eq([1, 2, 3])
    end

    it 'to be nil for "[#1,2,3]"' do
      expect('[#1,2,3]'.try_eval).to eq(nil)
    end

    it 'to be nil' do
      expect(nil.try_eval).to eq(nil)
    end
  end

  describe '#caller_name' do
    it 'to be "level1"' do
      expect(klass.level1).to eq('level1')
      expect(klass.level2).to eq('level1')
    end

    it 'to be "level3"' do
      expect(klass.level3).to eq('level3')
    end

    it 'to be "level4"' do
      expect(klass.level4).to eq('level4')
    end
  end

end
