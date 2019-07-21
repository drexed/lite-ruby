# frozen_string_literal: false

require 'spec_helper'

RSpec.describe OpenStruct do
  let(:o1) do
    described_class.new(name: 'bob', age: 60) do |o|
      o.gender = :M
    end
  end

  describe '#[]' do
    it 'to be "bob"' do
      expect(o1['name']).to eq('bob')
    end
  end

  describe '#[]=' do
    it 'to be "bill"' do
      o1['name'] = 'bill'

      expect(o1[:name]).to eq('bill')
    end
  end

  describe '#attributes' do
    it 'to be { ... }' do
      expect(o1.attributes).to eq(name: 'bob', age: 60, gender: :M)
    end
  end

  describe '#replace' do
    it 'to be "tom"' do
      o1.replace(name: 'tom', age: 28)

      expect(o1.name).to eq('tom')
    end
  end

end
