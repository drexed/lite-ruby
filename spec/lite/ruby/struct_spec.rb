# frozen_string_literal: false

require 'spec_helper'

RSpec.describe Struct do
  let(:s1) do
    person = Struct.new(:name, :age)
    person.new('bob', 60)
  end

  describe '#attributes' do
    it 'to be { ... }' do
      expect(s1.attributes).to eq({ name: 'bob', age: 60 })
    end
  end

  describe '#replace' do
    it 'to be "tom"' do
      s1.replace(name: 'tom', age: 28)

      expect(s1.name).to eq('tom')
    end
  end

end
