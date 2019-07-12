# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Date do
  let(:date) { Date.parse('2014-01-09') }

  describe '#format' do
    it 'to be "1 09, 2014"' do
      s1 = 'month_unpadded day, year'
      s2 = '1 09, 2014'

      expect(date.format(s1)).to eq(s2)
    end
  end

  describe '#to_format' do
    it 'to be "January 9"' do
      s1 = 'January 9'

      expect(date.to_format(:day)).to eq(s1)
    end
  end

end
