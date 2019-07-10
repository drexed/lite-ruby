# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Numeric do

  describe '#add' do
    it 'to be 6' do
      expect(4.add(2)).to eq(6)
    end
  end

  describe '#byte_in_bytes' do
    it 'to be 3' do
      n1 = 3

      expect(n1.byte_in_bytes).to eq(n1)
      expect(n1.bytes_in_bytes).to eq(n1)
    end
  end

  describe '#centigram_in_grams' do
    it 'to be 0.03' do
      n1 = 3
      n2 = 0.03

      expect(n1.centigram_in_grams).to eq(n2)
      expect(n1.centigrams_in_grams).to eq(n2)
    end
  end

  describe '#centimeter_in_meters' do
    it 'to be 0.03' do
      n1 = 3
      n2 = 0.03

      expect(n1.centimeter_in_meters).to eq(n2)
      expect(n1.centimeters_in_meters).to eq(n2)
    end
  end

  describe '#century_in_second' do
    it 'to be 259200' do
      n1 = 3
      n2 = 9_467_280_000.0

      expect(n1.century_in_seconds).to eq(n2)
      expect(n1.centuries_in_seconds).to eq(n2)
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

  describe '#day_in_second' do
    it 'to be 259200' do
      n1 = 3
      n2 = 259_200

      expect(n1.day_in_seconds).to eq(n2)
      expect(n1.days_in_seconds).to eq(n2)
    end
  end

  describe '#decade_in_second' do
    it 'to be 259200' do
      n1 = 3
      n2 = 946_728_000.0

      expect(n1.decade_in_seconds).to eq(n2)
      expect(n1.decades_in_seconds).to eq(n2)
    end
  end

  describe '#decagram_in_grams' do
    it 'to be 30' do
      n1 = 3
      n2 = 30

      expect(n1.decagram_in_grams).to eq(n2)
      expect(n1.decagrams_in_grams).to eq(n2)
    end
  end

  describe '#decameter_in_meters' do
    it 'to be 30' do
      n1 = 3
      n2 = 30

      expect(n1.decameter_in_meters).to eq(n2)
      expect(n1.decameters_in_meters).to eq(n2)
    end
  end

  describe '#decigrams_in_grams' do
    it 'to be 0.3' do
      n1 = 3
      n2 = 0.30000000000000004

      expect(n1.decigram_in_grams).to eq(n2)
      expect(n1.decigrams_in_grams).to eq(n2)
    end
  end

  describe '#decimeter_in_meters' do
    it 'to be 0.3' do
      n1 = 3
      n2 = 0.30000000000000004

      expect(n1.decimeter_in_meters).to eq(n2)
      expect(n1.decimeters_in_meters).to eq(n2)
    end
  end

  describe '#decrement' do
    let(:n1) { 1 }

    it 'to be 2' do
      expect(n1.decrement).to eq(2)
    end

    it 'to be 1.5' do
      expect(n1.decrement(0.5)).to eq(1.5)
    end
  end

  describe '#degrees_to_radians' do
    it 'to be 1.5707963267948966' do
      expect(90.degrees_to_radians).to eq(1.5707963267948966)
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
    end

    it 'to be 0' do
      expect(4.divide(0)).to eq(0)
    end
  end

  describe '#exabyte_in_bytes' do
    it 'to be 3458764513820540928' do
      n1 = 3
      n2 = 3_458_764_513_820_540_928

      expect(n1.exabyte_in_bytes).to eq(n2)
      expect(n1.exabytes_in_bytes).to eq(n2)
    end
  end

  describe '#feet_in_inches' do
    it 'to be 36' do
      n1 = 3
      n2 = 36

      expect(n1.foot_in_inches).to eq(n2)
      expect(n1.feet_in_inches).to eq(n2)
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

  describe '#gigabyte_in_bytes' do
    it 'to be 3221225472' do
      n1 = 3
      n2 = 3_221_225_472

      expect(n1.gigabyte_in_bytes).to eq(n2)
      expect(n1.gigabytes_in_bytes).to eq(n2)
    end
  end

  describe '#gram_in_grams' do
    it 'to be 300' do
      n1 = 3

      expect(n1.gram_in_grams).to eq(n1)
      expect(n1.grams_in_grams).to eq(n1)
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

  describe '#hectogram_in_grams' do
    it 'to be 300' do
      n1 = 3
      n2 = 300

      expect(n1.hectogram_in_grams).to eq(n2)
      expect(n1.hectograms_in_grams).to eq(n2)
    end
  end

  describe '#hectometer_in_meters' do
    it 'to be 300' do
      n1 = 3
      n2 = 300

      expect(n1.hectometer_in_meters).to eq(n2)
      expect(n1.hectometers_in_meters).to eq(n2)
    end
  end

  describe '#hour_in_second' do
    it 'to be 10800' do
      n1 = 3
      n2 = 10_800

      expect(n1.hour_in_seconds).to eq(n2)
      expect(n1.hours_in_seconds).to eq(n2)
    end
  end

  describe '#inch_in_inches' do
    it 'to be 3' do
      n1 = 3

      expect(n1.inch_in_inches).to eq(n1)
      expect(n1.inches_in_inches).to eq(n1)
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

  describe '#kilobytes_in_bytes' do
    it 'to be 3072' do
      n1 = 3
      n2 = 3072

      expect(n1.kilobyte_in_bytes).to eq(n2)
      expect(n1.kilobytes_in_bytes).to eq(n2)
    end
  end

  describe '#kilograms_in_grams' do
    it 'to be 3000' do
      n1 = 3
      n2 = 3000

      expect(n1.kilogram_in_grams).to eq(n2)
      expect(n1.kilograms_in_grams).to eq(n2)
    end
  end

  describe '#kilometer_in_meters' do
    it 'to be 3000' do
      n1 = 3
      n2 = 3000

      expect(n1.kilometer_in_meters).to eq(n2)
      expect(n1.kilometers_in_meters).to eq(n2)
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

  describe '#metric_ton_in_grams' do
    it 'to be 3000000' do
      n1 = 3
      n2 = 3_000_000

      expect(n1.metric_ton_in_grams).to eq(n2)
      expect(n1.metric_tons_in_grams).to eq(n2)
    end
  end

  describe '#megabyte_in_bytes' do
    it 'to be 3145728' do
      n1 = 3
      n2 = 3_145_728

      expect(n1.megabyte_in_bytes).to eq(n2)
      expect(n1.megabytes_in_bytes).to eq(n2)
    end
  end

  describe '#meter_in_meters' do
    it 'to be 3' do
      n1 = 3

      expect(n1.meter_in_meters).to eq(n1)
      expect(n1.meters_in_meters).to eq(n1)
    end
  end

  describe '#mile_in_inches' do
    it 'to be 190080' do
      n1 = 3
      n2 = 190_080

      expect(n1.mile_in_inches).to eq(n2)
      expect(n1.miles_in_inches).to eq(n2)
    end
  end

  describe '#millennium_in_second' do
    it 'to be 94672800000.0' do
      n1 = 3
      n2 = 94_672_800_000.0

      expect(n1.millennium_in_seconds).to eq(n2)
      expect(n1.millenniums_in_seconds).to eq(n2)
    end
  end

  describe '#milligrams_in_grams' do
    it 'to be 0.003' do
      n1 = 3
      n2 = 0.003

      expect(n1.milligram_in_grams).to eq(n2)
      expect(n1.milligrams_in_grams).to eq(n2)
    end
  end

  describe '#millimeter_in_meters' do
    it 'to be 0.003' do
      n1 = 3
      n2 = 0.003

      expect(n1.millimeter_in_meters).to eq(n2)
      expect(n1.millimeters_in_meters).to eq(n2)
    end
  end

  describe '#minute_in_second' do
    it 'to be 180' do
      n1 = 3
      n2 = 180

      expect(n1.minute_in_seconds).to eq(n2)
      expect(n1.minutes_in_seconds).to eq(n2)
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

  describe '#nautical_mile_in_inches' do
    it 'to be 218740.26239999998' do
      n1 = 3
      n2 = 218_740.26239999998

      expect(n1.nautical_mile_in_inches).to eq(n2)
      expect(n1.nautical_miles_in_inches).to eq(n2)
    end
  end

  describe '#negative?' do
    it 'to be true' do
      expect(-1.negative?).to eq(true)
    end

    it 'to be false' do
      expect(1.negative?).to eq(false)
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

  describe '#ounce_in_ounces' do
    it 'to be 3' do
      n1 = 3

      expect(n1.ounce_in_ounces).to eq(n1)
      expect(n1.ounces_in_ounces).to eq(n1)
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

  describe '#petabyte_in_bytes' do
    it 'to be 3377699720527872' do
      n1 = 3
      n2 = 3_377_699_720_527_872

      expect(n1.petabyte_in_bytes).to eq(n2)
      expect(n1.petabytes_in_bytes).to eq(n2)
    end
  end

  describe '#positive?' do
    it 'to be true' do
      expect(1.positive?).to eq(true)
    end

    it 'to be false' do
      expect(-1.positive?).to eq(false)
    end
  end

  describe '#pound_in_ounces' do
    it 'to be 48' do
      n1 = 3
      n2 = 48

      expect(n1.pound_in_ounces).to eq(n2)
      expect(n1.pounds_in_ounces).to eq(n2)
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

  describe '#second_in_seconds' do
    it 'to be 3' do
      n1 = 3

      expect(n1.second_in_seconds).to eq(n1)
      expect(n1.seconds_in_seconds).to eq(n1)
    end
  end

  describe '#stone_in_ounces' do
    it 'to be 672' do
      n1 = 3
      n2 = 672

      expect(n1.stone_in_ounces).to eq(n2)
      expect(n1.stones_in_ounces).to eq(n2)
    end
  end

  describe '#subtract' do
    it 'to be 2' do
      expect(4.subtract(2)).to eq(2)
    end
  end

  describe '#terabyte_in_bytes' do
    it 'to be 3298534883328' do
      n1 = 3
      n2 = 3_298_534_883_328

      expect(n1.terabyte_in_bytes).to eq(n2)
      expect(n1.terabytes_in_bytes).to eq(n2)
    end
  end

  describe '#to_byte' do
    let(:n1) { 1 }
    let(:n2) { 1024 }

    it 'to be 1' do
      expect(n2.to_byte(:kilobyte, :megabyte)).to eq(n1)
    end

    it 'to be 5' do
      expect(5120.to_byte(:kilobyte, :megabyte)).to eq(5)
    end

    it 'to be 1024' do
      expect(n2.to_byte(:kilobyte, :kilobyte)).to eq(n2)
      expect(n1.to_byte(:megabyte, :kilobyte)).to eq(n2)
    end

    it 'to be 1048576' do
      expect(n1.to_byte(:gigabyte, :kilobyte)).to eq(1_048_576)
    end

    it 'to be 0.078125' do
      expect(80.to_byte(:megabyte, :gigabyte)).to eq(0.078125)
    end

    it 'to raise error' do
      expect { n1.to_byte }.to raise_error(ArgumentError)
      expect { n1.to_byte(:bad, :kilobyte) }.to raise_error(ArgumentError)
      expect { n1.to_byte(:kilobyte, :bad) }.to raise_error(ArgumentError)
      expect { n1.to_byte(:bad, :bad) }.to raise_error(ArgumentError)
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
    end

    it 'to be @3.11' do
      expect(n2.to_currency(unit: '@')).to eq('@3.11')
    end

    it 'to be $3.00000' do
      expect(n1.to_currency(precision: 5)).to eq('$3.00000')
    end

    it 'to be $3.11' do
      expect(3.11111.to_currency).to eq('$3.11')
    end
  end

  describe '#to_length' do
    let(:n1) { 1 }
    let(:n2) { 10 }
    let(:n3) { 12 }

    it 'to be 1' do
      expect(n1.to_length(:millimeter, :millimeter)).to eq(n1)
      expect(n1.to_length(:inches, :inches)).to eq(n1)
      expect(n2.to_length(:millimeters, :centimeters)).to eq(n1)
      expect(n3.to_length(:inches, :feet)).to eq(n1)
    end

    it 'to be 10' do
      expect(n1.to_length(:centimeters, :millimeters)).to eq(n2)
    end

    it 'to be 12' do
      expect(n1.to_length(:feet, :inches)).to eq(n3)
    end

    it 'to be 30.479999999999997' do
      expect(n1.to_length(:feet, :centimeters)).to eq(30.479999999999997)
    end

    it 'to be 1093.6138888888888' do
      expect(n1.to_length(:kilometer, :yard)).to eq(1093.6138888888888)
    end

    it 'to be 6076.118399999999' do
      expect(n1.to_length(:nautical_miles, :feet)).to eq(6076.118399999999)
    end

    it 'to raise error' do
      expect { n1.to_length }.to raise_error(ArgumentError)
      expect { n1.to_length(:bad, :meters) }.to raise_error(ArgumentError)
      expect { n1.to_length(:meters, :bad) }.to raise_error(ArgumentError)
      expect { n1.to_length(:bad, :bad) }.to raise_error(ArgumentError)
    end
  end

  describe '#to_mass' do
    let(:n1) { 1 }
    let(:n2) { 10 }
    let(:n3) { 16 }

    it 'to be 1' do
      expect(n1.to_mass(:milligram, :milligram)).to eq(n1)
      expect(n1.to_mass(:ounces, :ounces)).to eq(n1)
      expect(n2.to_mass(:milligram, :centigram)).to eq(n1)
      expect(n3.to_mass(:ounces, :pounds)).to eq(n1)
    end

    it 'to be 1.360776' do
      expect(3.to_mass(:pound, :kilogram)).to eq(1.360776)
    end

    it 'to be 1.1023125' do
      expect(n1.to_mass(:metric_ton, :ton)).to eq(1.1023125)
    end

    it 'to be 2.204625' do
      expect(n1.to_mass(:kilograms, :pounds)).to eq(2.204625)
    end

    it 'to be 10' do
      expect(n1.to_mass(:centigrams, :milligrams)).to eq(n2)
    end

    it 'to be 16' do
      expect(n1.to_mass(:pounds, :ounces)).to eq(n3)
    end

    it 'to be 64000' do
      expect(2.to_mass(:tons, :pounds)).to eq(4000)
    end

    it 'to raise error' do
      expect { n1.to_mass }.to raise_error(ArgumentError)
      expect { n1.to_mass(:bad, :pound) }.to raise_error(ArgumentError)
      expect { n1.to_mass(:pound, :bad) }.to raise_error(ArgumentError)
      expect { n1.to_mass(:bad, :bad) }.to raise_error(ArgumentError)
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
    end

    it 'to be 3.11@' do
      expect(3.11.to_percentage(unit: '@')).to eq('3.11@')
    end

    it 'to be 3.00000%' do
      expect(n1.to_percentage(precision: 5)).to eq('3.00000%')
    end

    it 'to be 3.11%' do
      expect(3.11111.to_percentage).to eq('3.11%')
    end
  end

  describe '#to_temperature' do
    let(:n1) { 1 }
    let(:n2) { 100 }
    let(:n3) { 212 }
    let(:n4) { 373.15 }

    it 'to be 212' do
      expect(n2.to_temperature(:celsius, :fahrenheit)).to eq(n3)
    end

    it 'to be 100' do
      expect(n2.to_temperature(:celsius, :celsius)).to eq(n2)
      expect(n3.to_temperature(:fahrenheit, :celsius)).to eq(n2)
    end

    it 'to be 373.15' do
      expect(n2.to_temperature(:celsius, :kelvin)).to eq(n4)
      expect(n3.to_temperature(:fahrenheit, :kelvin)).to eq(n4)
    end

    it 'to be -173.15' do
      expect(n2.to_temperature(:kelvin, :celsius)).to eq(-173.14999999999998)
    end

    it 'to be -279.67' do
      expect(n2.to_temperature(:kelvin, :fahrenheit)).to eq(-279.66999999999996)
    end

    it 'to raise error' do
      expect { n1.to_temperature }.to raise_error(ArgumentError)
      expect { n1.to_temperature(:bad, :kelvin) }.to raise_error(ArgumentError)
      expect { n1.to_temperature(:kelvin, :bad) }.to raise_error(ArgumentError)
      expect { n1.to_temperature(:bad, :bad) }.to raise_error(ArgumentError)
    end
  end

  # describe '#to_time' do
  #   let(:n1) { 1 }
  #   let(:n2) { 2 }
  #
  #   it 'to be 2' do
  #     expect(120.to_time(:seconds, :minutes)).to eq(n2)
  #   end
  #
  #   it 'to be 40' do
  #     expect(2400.to_time(:minutes, :hours)).to eq(40)
  #   end
  #
  #   it 'to be 3' do
  #     expect(72.to_time(:hours, :days)).to eq(3)
  #   end
  #
  #   it 'to be 5' do
  #     expect(1825.to_time(:days, :years)).to eq(4.996577686516085)
  #   end
  #
  #   it 'to be 172800' do
  #     expect(n2.to_time(:days, :seconds)).to eq(172_800)
  #   end
  #
  #   it 'to raise error' do
  #     expect { n1.to_time }.to raise_error(ArgumentError)
  #     expect { n1.to_time(:bad, :days) }.to raise_error(ArgumentError)
  #     expect { n1.to_time(:days, :bad) }.to raise_error(ArgumentError)
  #     expect { n1.to_time(:bad, :bad) }.to raise_error(ArgumentError)
  #   end
  # end

  describe '#ton_in_ounces' do
    it 'to be 96000' do
      n1 = 3
      n2 = 96_000

      expect(n1.ton_in_ounces).to eq(n2)
      expect(n1.tons_in_ounces).to eq(n2)
    end
  end

  describe '#within?' do
    it 'to be true' do
      expect(10.006.within?(10, 0.1)).to eq(true)
      expect(100.4.within?(100.6, 1)).to eq(true)
    end
  end

  describe '#week_in_seconds' do
    it 'to be 1814400' do
      n1 = 3
      n2 = 1_814_400

      expect(n1.week_in_seconds).to eq(n2)
      expect(n1.weeks_in_seconds).to eq(n2)
    end
  end

  describe '#yard_in_inches' do
    it 'to be 36' do
      n1 = 3
      n2 = 108

      expect(n1.yard_in_inches).to eq(n2)
      expect(n1.yards_in_inches).to eq(n2)
    end
  end

  describe '#year_in_seconds' do
    it 'to be 94672800.0' do
      n1 = 3
      n2 = 94_672_800.0

      expect(n1.year_in_seconds).to eq(n2)
      expect(n1.years_in_seconds).to eq(n2)
    end
  end

end
