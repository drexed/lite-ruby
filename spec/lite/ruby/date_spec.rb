# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Date do
  let(:s1) { '2014-01-09' }
  let(:date) { described_class.parse(s1) }

  describe '#format' do
    it 'to be "2014-01-09"' do
      expect(date.format).to eq(s1)
    end

    it 'to be "1 09, 2014"' do
      s1 = 'month_unpadded day, year'
      s2 = '1 09, 2014'

      expect(date.format(s1)).to eq(s2)
    end
  end

  describe '#stamp' do
    it 'to be "2014-01-09"' do
      expect(date.stamp).to eq(s1)
      expect(date.stamp).to eq(s1)
    end

    it 'to be "January 9"' do
      s1 = 'January 9'

      expect(date.stamp(:day)).to eq(s1)
      expect(date.to_format(:day)).to eq(s1)
    end
  end

end
