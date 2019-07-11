# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Numeric do

  describe '#add' do
    it 'to be 6' do
      expect(4.add(2)).to eq(6)
    end
  end

  describe '#clamp' do
    let(:n1) { 1 }
    let(:n2) { 3 }
    let(:n3) { 5 }
    let(:n4) { 6 }
    let(:n5) { 8 }

    it 'to be 3' do
      expect(n1.clamp(n2, n4)).to eq(n2)
      expect(n1.clamp(n2..n4)).to eq(n2)
    end

    it 'to be 5' do
      expect(n3.clamp(n2, n4)).to eq(n3)
      expect(n3.clamp(n2..n4)).to eq(n3)
    end

    it 'to be 6' do
      expect(n5.clamp(n2, n4)).to eq(n4)
      expect(n5.clamp(n2..n4)).to eq(n4)
    end
  end

  describe '#decrement' do
    let(:n1) { 1 }
    let(:n2) { 0.5 }

    it 'to be 2' do
      expect(n1.decrement).to eq(0)
    end

    it 'to be 0.5' do
      expect(n1.decrement(n2)).to eq(n2)
    end
  end

  describe '#distance' do
    it 'to be 2' do
      n1 = 3
      n2 = 5
      n3 = 2

      expect(n2.distance(n1)).to eq(n3)
      expect(n1.distance(n2)).to eq(n3)
    end
  end

  describe '#divide' do
    it 'to be 2' do
      expect(4.divide(2)).to eq(2)
    end

    it 'to be 0' do
      expect(0.divide(2)).to eq(0)
      expect(4.divide(0)).to eq(0)
    end
  end

  describe '#equal_to?' do
    let(:n1) { 1 }

    it 'to be true' do
      expect(n1.equal_to?(n1)).to eq(true)
    end

    it 'to be false' do
      expect(n1.equal_to?(2)).to eq(false)
    end
  end

  describe '#fraction' do
    it 'to be 0.2456' do
      n1 = 0.2455999999999996

      expect(12.2456.fraction).to eq(n1)
      expect(-12.2456.fraction).to eq(n1)
    end

    it 'to be 0.0' do
      expect(1.0.fraction).to eq(0.0)
    end
  end

  describe '#fraction?' do
    it 'to be true' do
      expect(12.2456.fraction?).to eq(true)
    end

    it 'to be false' do
      expect(1.0.fraction?).to eq(false)
    end
  end

  describe '#greater_than?' do
    let(:n1) { 3 }

    it 'to be true' do
      expect(n1.greater_than?(2)).to eq(true)
    end

    it 'to be false' do
      expect(n1.greater_than?(n1)).to eq(false)
      expect(n1.greater_than?(4)).to eq(false)
    end
  end

  describe '#greater_than_or_equal_to?' do
    let(:n1) { 3 }

    it 'to be true' do
      expect(n1.greater_than_or_equal_to?(2)).to eq(true)
      expect(n1.greater_than_or_equal_to?(n1)).to eq(true)
    end

    it 'to be false' do
      expect(n1.greater_than_or_equal_to?(4)).to eq(false)
    end
  end

  describe '#inside?' do
    it 'to be true' do
      expect(3.inside?(1, 5)).to eq(true)
    end

    it 'to be false' do
      expect(3.inside?(3, 5)).to eq(false)
    end
  end

  describe '#less_than?' do
    let(:n1) { 3 }

    it 'to be true' do
      expect(n1.less_than?(4)).to eq(true)
    end

    it 'to be false' do
      expect(n1.less_than?(n1)).to eq(false)
      expect(n1.less_than?(2)).to eq(false)
    end
  end

  describe '#less_than_or_equal_to?' do
    let(:n1) { 3 }

    it 'to be true' do
      expect(n1.less_than_or_equal_to?(4)).to eq(true)
      expect(n1.less_than_or_equal_to?(n1)).to eq(true)
    end

    it 'to be false' do
      expect(n1.less_than_or_equal_to?(2)).to eq(false)
    end
  end

  describe '#multiply' do
    it 'to be 8' do
      expect(4.multiply(2)).to eq(8)
    end
  end

  describe '#multiple_of?' do
    it 'to be true' do
      expect(9.multiple_of?(3)).to eq(true)
    end

    it 'to be false' do
      expect(10.multiple_of?(3)).to eq(false)
    end
  end

  describe '#not_equal_to?' do
    let(:n1) { 1 }

    it 'to be false' do
      expect(n1.not_equal_to?(n1)).to eq(false)
    end

    it 'to be true' do
      expect(n1.not_equal_to?(2)).to eq(true)
    end
  end

  describe '#ordinal' do
    it 'to be st' do
      expect(1.ordinal).to eq('st')
    end

    it 'to be nd' do
      expect(2.ordinal).to eq('nd')
    end

    it 'to be rd' do
      expect(3.ordinal).to eq('rd')
    end

    it 'to be th' do
      expect(11.ordinal).to eq('th')
    end
  end

  describe '#ordinalize' do
    it 'to be st' do
      expect(1.ordinalize).to eq('1st')
    end

    it 'to be nd' do
      expect(2.ordinalize).to eq('2nd')
    end

    it 'to be rd' do
      expect(3.ordinalize).to eq('3rd')
    end

    it 'to be th' do
      expect(11.ordinalize).to eq('11th')
    end
  end

  describe '#outside?' do
    let(:n1) { 3 }

    it 'to be true' do
      expect(n1.outside?(4, 5)).to eq(true)
    end

    it 'to be false' do
      expect(n1.outside?(3, 5)).to eq(false)
    end
  end

  describe '#pad' do
    let(:n1) { 3 }

    it 'to be 003' do
      expect(n1.pad).to eq('003')
    end

    it 'to be 113' do
      expect(n1.pad(pad_number: 1)).to eq('113')
    end

    it 'to be 0003' do
      expect(n1.pad(precision: 4)).to eq('0003')
    end

    it 'to be 003.5' do
      expect(3.5.pad(precision: 5)).to eq('003.5')
    end
  end

  describe '#pad_precision' do
    let(:n1) { 3 }

    it 'to be 3' do
      expect(n1.pad_precision).to eq('3.00')
    end

    it 'to be 3.50' do
      expect(3.5.pad_precision).to eq('3.50')
    end

    it 'to be 3.11' do
      expect(n1.pad_precision(pad_number: 1)).to eq('3.11')
    end

    it 'to be 3.000' do
      expect(n1.pad_precision(precision: 3)).to eq('3.000')
    end

    it 'to be 3,00' do
      expect(n1.pad_precision(separator: ',')).to eq('3,00')
    end
  end

  describe '#percentage_of' do
    let(:n1) { 0 }
    let(:n2) { 2 }
    let(:n3) { 4 }

    it 'to be 0' do
      expect(n1.percentage_of(n3)).to eq(n1)
      expect(n2.percentage_of(n1)).to eq(n1)
    end

    it 'to be 50.0' do
      expect(n2.percentage_of(n3)).to eq(50.0)
    end
  end

  describe '#power' do
    it 'to be 16' do
      expect(4.power(2)).to eq(16)
    end
  end

  describe '#root' do
    it 'to be 2' do
      expect(4.root(2)).to eq(2)
    end
  end

  describe '#subtract' do
    it 'to be 2' do
      expect(4.subtract(2)).to eq(2)
    end
  end

  describe '#to_currency' do
    let(:n1) { 3 }
    let(:n2) { 3.11 }

    it 'to be $3.00' do
      expect(n1.to_currency).to eq('$3.00')
    end

    it 'to be $3.10' do
      expect(3.1.to_currency).to eq('$3.10')
    end

    it 'to be $3.11' do
      expect(n2.to_currency).to eq('$3.11')
      expect(3.11111.to_currency).to eq('$3.11')
    end

    it 'to be @3.11' do
      expect(n2.to_currency(unit: '@')).to eq('@3.11')
    end

    it 'to be $3.00000' do
      expect(n1.to_currency(precision: 5)).to eq('$3.00000')
    end
  end

  describe '#to_nearest_value' do
    it 'to be 6' do
      expect(5.to_nearest_value([1, 3, 6, 9])).to eq(6)
    end

    it 'to be 3.6' do
      expect(3.5.to_nearest_value([3.0, 3.3, 3.6, 3.9])).to eq(3.6)
    end
  end

  describe '#to_percentage' do
    let(:n1) { 3 }

    it 'to be 3.00%' do
      expect(n1.to_percentage).to eq('3.00%')
    end

    it 'to be 3.10%' do
      expect(3.1.to_percentage).to eq('3.10%')
    end

    it 'to be 3.11%' do
      expect(3.11.to_percentage).to eq('3.11%')
      expect(3.11111.to_percentage).to eq('3.11%')
    end

    it 'to be 3.11@' do
      expect(3.11.to_percentage(unit: '@')).to eq('3.11@')
    end

    it 'to be 3.00000%' do
      expect(n1.to_percentage(precision: 5)).to eq('3.00000%')
    end
  end

  describe '#within?' do
    it 'to be true' do
      expect(10.006.within?(10, 0.1)).to eq(true)
      expect(100.4.within?(100.6, 1)).to eq(true)
    end
  end

end
