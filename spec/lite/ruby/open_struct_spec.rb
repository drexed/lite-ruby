# frozen_string_literal: false

require 'spec_helper'

RSpec.describe OpenStruct do
  let(:o1) do
    described_class.new(name: 'bob', age: 60) do |o|
      o.gender = :M
    end
  end

  describe '#attributes' do
    it 'to be { ... }' do
      expect(o1.attributes).to eq(name: 'bob', age: 60)
    end
  end

  describe '#replace' do
    it 'to be "tom"' do
      o1.replace(name: 'tom', age: 28)

      expect(o1.name).to eq('tom')
    end
  end

end
