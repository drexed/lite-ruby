# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Time do
  let(:s1) { '2014-01-09 00:31' }
  let(:time) { described_class.parse('2014-01-09 00:31:58 UTC') }

  describe '#elapse' do
    let(:n1) { 1 }

    it 'to be 1' do
      expect(described_class.elapse { sleep(n1) }.to_i).to eq(n1)
    end

    it 'to be { ... }' do
      expect(described_class.elapse(verbose: true) { sleep(n1) }).to be_a(Hash)
    end
  end

  describe '#format' do
    it 'to be "2014-01-09 00:31"' do
      expect(time.format).to eq(s1)
    end

    it 'to be "January 9, 2014 12:31 am +0000"' do
      s1 = 'month_name day_unpadded, year hour12:minute ampm time_zone'
      s2 = 'January 9, 2014 12:31 am +0000'

      expect(time.format(s1)).to eq(s2)
    end
  end

  describe '#monotonic' do
    it 'to be a Float' do
      expect(described_class.monotonic).to be_a(Float)
    end
  end

  describe '#stamp' do
    it 'to be "2014-01-09 00:31"' do
      expect(time.stamp).to eq(s1)
      expect(time.to_format).to eq(s1)
    end

    it 'to be "2014-01-09 12:31 am UTC"' do
      s1 = '2014-01-09 12:31 am +0000'

      expect(time.stamp(:datetime12_iso_tzn)).to eq(s1)
      expect(time.to_format(:datetime12_iso_tzn)).to eq(s1)
    end
  end

end
