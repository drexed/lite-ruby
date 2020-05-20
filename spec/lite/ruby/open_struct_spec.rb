# frozen_string_literal: false

require 'spec_helper'

RSpec.describe OpenStruct do
  let(:h1) do
    { table: { name: 'bob', age: 60, gender: :M } }
  end
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
      expect(o1.attributes).to eq(h1[:table])
    end
  end

  describe '#replace' do
    it 'to be "tom"' do
      o1.replace(name: 'tom', age: 28)

      expect(o1.name).to eq('tom')
    end
  end

  describe '#to_hash' do
    it 'to be { ... } with table key' do
      expect(o1.to_hash).to eq(h1)
    end

    it 'to be { ... } without table key' do
      expect(o1.to_hash(table: false)).to eq(h1[:table])
    end
  end


  describe '#to_json' do
    it 'to be { ... } with table key' do
      expect(o1.to_json).to eq(h1.to_json)
    end

    it 'to be { ... } without table key' do
      expect(o1.to_json(table: false)).to eq(h1[:table].to_json)
    end
  end

end
