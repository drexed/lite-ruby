# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Time do
  let(:s1) { '2014-01-09 00:31' }
  let(:time) { described_class.parse('2014-01-09 00:31:58 UTC') }

  describe '#format' do
    it 'to be "2014-01-09 00:31"' do
      expect(time.format).to eq(s1)
    end

    it 'to be "January 9, 2014 12:31 am +0000"' do
      s1 = 'month_name day_unpadded, year hour_12:minute ampm time_zone'
      s2 = 'January 9, 2014 12:31 am +0000'

      expect(time.format(s1)).to eq(s2)
    end
  end

  describe '#stamp' do
    it 'to be "2014-01-09 00:31"' do
      expect(time.stamp).to eq(s1)
      expect(time.to_format).to eq(s1)
    end

    it 'to be "2014-01-09 12:31 am UTC"' do
      s1 = '2014-01-09 12:31 am +0000'

      expect(time.stamp(:datetime_12_iso_tzn)).to eq(s1)
      expect(time.to_format(:datetime_12_iso_tzn)).to eq(s1)
    end
  end

  describe '#elapse' do
    it 'to be 1' do
      n1 = 1

      expect(described_class.elapse { sleep(n1) }.to_i).to eq(n1)
    end
  end

end
