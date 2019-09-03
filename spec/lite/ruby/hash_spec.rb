# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Hash do

  describe '#zip' do
    it 'to be { a: 1, b: 2, c: 3 }' do
      a1 = %i[a b c]
      a2 = [1, 2, 3]
      h1 = { a: 1, b: 2, c: 3 }

      expect(described_class.zip(a1, a2)).to eq(h1)
    end
  end

  describe '#aka' do
    it 'to be true' do
      h1 = { foo: 'bar', baz: 'boo' }
      h1.aka('boo', :foo)

      expect(h1.key?('boo')).to eq(true)
    end
  end

  describe '#assert_min_keys!' do
    it 'to be {}' do
      expect({}.assert_min_keys!(:foo)).to eq({})
    end

    it 'to be { foo: "bar", bar: "baz" }' do
      hash = { foo: 'bar', bar: 'baz' }

      expect(hash.assert_min_keys!(:foo)).to eq(hash)
    end

    it 'to raise error' do
      expect { { bum: 'bar', baz: 'boz' }.assert_min_keys!(:foo) }.to raise_error(ArgumentError)
    end
  end

  describe '#assert_all_min_keys!' do
    it 'to raise error' do
      expect { {}.assert_all_min_keys!(:foo) }.to raise_error(ArgumentError)
    end
  end

  describe '#assert_pair_presence!' do
    it 'to be {}' do
      expect({}.assert_pair_presence!(:foo)).to eq({})
    end

    it 'to be { foo: "bar" }' do
      expect({ foo: 'bar' }.assert_pair_presence!(:foo)).to eq(foo: 'bar')
    end

    it 'to raise error for unwanted key' do
      hash = { foo: 'bar', baz: 'boz' }

      expect { hash.assert_pair_presence!(:foo) }.to raise_error(ArgumentError)
    end

    it 'to raise error for nil value' do
      expect { { foo: nil }.assert_pair_presence!(:foo) }.to raise_error(ArgumentError)
    end
  end

  describe '#assert_all_pair_presence!' do
    it 'to raise error' do
      expect { {}.assert_all_pair_presence!(:foo) }.to raise_error(ArgumentError)
    end
  end

  describe '#assert_valid_keys!' do
    it 'to be {}' do
      expect({}.assert_valid_keys!(:foo)).to eq({})
    end

    it 'to be { foo: "bar" }' do
      expect({ foo: 'bar' }.assert_valid_keys!(:foo)).to eq(foo: 'bar')
    end

    it 'to raise error' do
      expect { { foo: 'bar', baz: 'boz' }.assert_valid_keys!(:foo) }.to raise_error(ArgumentError)
    end
  end

  describe '#assert_all_valid_keys!' do
    it 'to raise error' do
      expect { {}.assert_all_valid_keys!(:foo) }.to raise_error(ArgumentError)
    end
  end

  describe '#assert_valid_values!' do
    it 'to be {}' do
      expect({}.assert_valid_values!(:foo)).to eq({})
    end

    it 'to be { foo: "bar" }' do
      expect({ foo: 'bar' }.assert_valid_values!('bar')).to eq(foo: 'bar')
    end

    it 'to raise error' do
      expect { { foo: 'bar', baz: 'boz' }.assert_valid_values!(:foo) }.to raise_error(ArgumentError)
    end
  end

  describe '#assert_all_valid_values!' do
    it 'to raise error' do
      expect { {}.assert_all_valid_values!(:foo) }.to raise_error(ArgumentError)
    end
  end

  describe '#bury' do
    let(:h1) do
      { foo: { baz: 'boo' } }
    end

    it 'to be { foo: :moo }' do
      expect(h1.bury(:foo, :moo)).to eq(foo: :moo)
    end

    it 'to be { foo: { baz: :moo } }' do
      h1 = { foo: { baz: 'boo' } }

      expect(h1.bury(:foo, :baz, :moo)).to eq(foo: { baz: :moo })
    end

    it 'to raise error' do
      expect { h1.bury(:moo) }.to raise_error(ArgumentError)
    end
  end

  describe '#collate(!)' do
    it 'to be { a: [1, 3], b: [2, 4], c: [5] }' do
      h1 = { a: 1, b: 2 }
      h2 = { a: 3, b: 4, c: 5 }
      h3 = { a: [1, 3], b: [2, 4], c: [5] }

      expect(h1.collate(h2)).to eq(h3)
      expect(h1.collate!(h2)).to eq(h3)
    end
  end

  describe '#collect_keys' do
    it 'to be ["FOO", "BAZ"]' do
      h1 = { foo: 'bar', baz: 'boo' }
      a1 = %w[FOO BAZ]

      expect(h1.collect_keys { |k| k.to_s.upcase }).to eq(a1)
    end
  end

  describe '#collect_values' do
    it 'to be ["BAR", "BOO"]' do
      h1 = { foo: 'bar', baz: 'boo' }
      a1 = %w[BAR BOO]

      expect(h1.collect_values { |k| k.to_s.upcase }).to eq(a1)
    end
  end

  describe '#dearray_values(!)' do
    let(:h1) do
      { a: [1], b: [1, 2], c: 3, d: [] }
    end

    it 'to be { a: 1, b: 1, c: 3, d: nil } for 0 index' do
      h2 = { a: 1, b: 1, c: 3, d: nil }

      expect(h1.dearray_values).to eq(h2)
      expect(h1.dearray_values!).to eq(h2)
    end

    it 'to be { a: 1, b: 2, c: 3, d: nil } for 1 index' do
      h2 = { a: 1, b: 2, c: 3, d: nil }

      expect(h1.dearray_values(1)).to eq(h2)
      expect(h1.dearray_values!(1)).to eq(h2)
    end
  end

  describe '#deep_dup' do
    it 'to be properly set vars on diff objects' do
      h1 = { a: { b: 'b' } }
      h2 = h1.deep_dup
      h2[:a][:c] = 'c'

      expect(h1[:a][:c]).to eq(nil)
      expect(h2[:a][:c]).to eq('c')
    end
  end

  describe '#delete_unless' do
    it 'to be { a: 1 }' do
      h1 = { a: 1, b: 2, c: 3 }
      h2 = { a: 1 }

      h1.delete_unless { |_, v| v == 1 }

      expect(h1).to eq(h2)
    end
  end

  describe '#delete_values' do
    it 'to be { b: 2 }' do
      h1 = { a: 1, b: 2 }
      h2 = { b: 2 }

      h1.delete_values(1)

      expect(h1).to eq(h2)
    end
  end

  describe '#diff' do
    let(:h1) do
      { a: 1, b: 2 }
    end
    let(:h2) do
      { a: 1, b: 3 }
    end

    it 'to be { b: 2 }' do
      h3 = { b: 2 }

      expect(h1.diff(h2)).to eq(h3)
    end

    it 'to be { b: 3 }' do
      h3 = { b: 3 }

      expect(h2.diff(h1)).to eq(h3)
    end
  end

  describe '#deep_dup(!)' do
    it 'to be { a: false, b: { c: [1, 2, 3], x: [3, 4, 5] } }' do
      h1 = { a: true, b: { c: [1, 2, 3] } }
      h2 = { a: false, b: { x: [3, 4, 5] } }
      h3 = { a: false, b: { c: [1, 2, 3], x: [3, 4, 5] } }

      expect(h1.deep_merge(h2)).to eq(h3)
      expect(h1.deep_merge!(h2)).to eq(h3)
    end
  end

  describe '#demote(!)' do
    let(:h1) do
      { a: 0, b: 1, c: 2 }
    end

    it 'to be { a: 0, c: 2, b: 1 }' do
      expect(h1.demote(:b)).to eq(a: 0, c: 2, b: 1)
    end

    it 'to be { a: 0, b: 1, c: 2 }' do
      expect(h1.demote!(:d)).to eq(h1)
    end
  end

  describe '#denillify(!)' do
    let(:h1) do
      { abc: nil, xyz: 1 }
    end

    it 'to be { abc: 0, xyz: 1 }' do
      h2 = { abc: 0, xyz: 1 }

      expect(h1.denillify).to eq(h2)
      expect(h1.denillify!).to eq(h2)
    end

    it 'to be { abc: 9, xyz: 1 }' do
      h2 = { abc: 9, xyz: 1 }

      expect(h1.denillify(9)).to eq(h2)
      expect(h1.denillify!(9)).to eq(h2)
    end
  end

  describe '#except(!)' do
    let(:h1) do
      { foo: 1, baz: 2, bar: 3 }
    end

    it 'to be {}' do
      h1 = {}
      k1 = :foo

      expect(h1.except(k1)).to eq(h1)
      expect(h1.except!(k1)).to eq(h1)
    end

    it 'to be { :foo => 1 }' do
      h2 = { foo: 1 }
      a1 = %i[baz bar]

      expect(h1.except(*a1)).to eq(h2)
      expect(h1.except!(*a1)).to eq(h2)
    end

    it 'to be { :baz => 2, :bar => 3 }' do
      h2 = { baz: 2, bar: 3 }
      k1 = :foo

      expect(h1.except(k1)).to eq(h2)
      expect(h1.except!(k1)).to eq(h2)
    end
  end

  describe '#extract!' do
    it 'to be {}' do
      expect({}.extract!(:foo)).to eq({})
    end

    it 'to be { foo: 1 }' do
      expect({ foo: 1, baz: 2, bar: 3 }.extract!(:foo)).to eq(foo: 1)
    end
  end

  describe '#hmap!' do
    it 'to be { a: 4, b: 5, c: 6 }' do
      h1 = { a: 1, b: 2, c: 3 }
      h2 = { a: 4, b: 5, c: 6 }

      expect(h1.hmap { |k, v| { k => v + 3 } }).to eq(h2)
      expect(h1.hmap! { |k, v| { k => v + 3 } }).to eq(h2)
    end
  end

  describe '#insert' do
    it 'to be true' do
      h1 = { a: 1, b: 2 }

      expect(h1.insert(:c, 3)).to eq(true)
    end

    it 'to be false' do
      h1 = { a: 1, b: 2 }

      expect(h1.insert(:b, 3)).to eq(false)
    end
  end

  describe '#invert' do
    it 'to be { 2 => :d, 3 => %i[f c b a], 9 => %i[g e] }' do
      h1 = { a: 3, b: 3, c: 3, d: 2, e: 9, f: 3, g: 9 }
      h2 = { 2 => :d, 3 => %i[f c b a], 9 => %i[g e] }

      expect(h1.invert).to eq(h2)
    end
  end

  describe '#keys?' do
    let(:h1) do
      { a: 0, b: 1 }
    end

    it 'to be true' do
      expect(h1.keys?(:a, :b)).to eq(true)
    end

    it 'to be false' do
      expect(h1.keys?(:z)).to eq(false)
    end
  end

  describe '#nillify' do
    it 'to be { a: 1, b: "test", c: nil, d: nil, e: nil, f: nil }' do
      h1 = { a: 1, b: 'test', c: nil, d: false, e: '', f: ' ' }
      h2 = { a: 1, b: 'test', c: nil, d: nil, e: nil, f: nil }

      expect(h1.nillify).to eq(h2)
      expect(h1.nillify!).to eq(h2)
    end
  end

  describe '#only_fill(!)' do
    it 'to be { foo: nil }' do
      h1 = {}
      h2 = { foo: nil }
      k1 = :foo

      expect(h1.only_fill(k1)).to eq(h2)
      expect(h1.only_fill!(k1)).to eq(h2)
    end

    it 'to be { foo: 0 }' do
      h1 = {}
      h2 = { foo: 0 }
      a1 = [:foo, placeholder: 0]

      expect(h1.only_fill(*a1)).to eq(h2)
      expect(h1.only_fill!(*a1)).to eq(h2)
    end

    it 'to be { :foo => 1 }' do
      h1 = { foo: 1, baz: 2 }
      h2 = { foo: 1, bar: nil }
      a1 = %i[foo bar]

      expect(h1.only_fill(*a1)).to eq(h2)
      expect(h1.only_fill!(*a1)).to eq(h2)
    end
  end

  describe '#only_keys?' do
    let(:h1) do
      { a: 0, b: 1 }
    end

    it 'to be true' do
      expect(h1.only_keys?(:a, :b)).to eq(true)
    end

    it 'to be false' do
      expect(h1.only_keys?(:a)).to eq(false)
    end
  end

  describe '#pair?' do
    h1 = { a: 1 }

    it 'to be true' do
      expect(h1.pair?(:a, 1)).to eq(true)
    end

    it 'to be false' do
      expect(h1.pair?(:a, 2)).to eq(false)
    end
  end

  describe '#promote(!)' do
    let(:h1) do
      { a: 0, b: 1, c: 2 }
    end

    it 'to be { b: 1, a: 0, c: 2 }' do
      expect(h1.promote(:b)).to eq(b: 1, a: 0, c: 2)
    end

    it 'to be { a: 0, b: 1, c: 2 }' do
      expect(h1.promote!(:d)).to eq(h1)
    end
  end

  describe '#rename_keys(!)' do
    it 'to be [:baz, :bar]' do
      h1 = { foo: 'foo', baz: 'baz' }
      h2 = { foo: :bar }
      a1 = %i[baz bar]

      expect(h1.rename_keys(h2).keys).to eq(a1)
      expect(h1.rename_keys!(h2).keys).to eq(a1)
    end

    it 'to be [:foo, "tick"]' do
      h1 = { foo: 'foo', 'baz' => 'baz' }
      h2 = { 'baz' => 'tick' }
      a1 = [:foo, 'tick']

      expect(h1.rename_keys(h2).keys).to eq(a1)
      expect(h1.rename_keys!(h2).keys).to eq(a1)
    end

    it 'to be [:bar, :tick]' do
      h1 = { foo: 'foo', baz: 'baz' }
      h2 = { foo: :bar, baz: :tick }
      a1 = %i[bar tick]

      expect(h1.rename_keys(h2).keys).to eq(a1)
      expect(h1.rename_keys!(h2).keys).to eq(a1)
    end

    it 'to be [:bar, "tick"]' do
      h1 = { foo: 'foo', 'baz' => 'baz' }
      h2 = { foo: :bar, 'baz' => 'tick' }
      a1 = [:bar, 'tick']

      expect(h1.rename_keys(h2).keys).to eq(a1)
      expect(h1.rename_keys!(h2).keys).to eq(a1)
    end
  end

  describe '#reverse_merge(!)' do
    let(:h1) do
      { foo: 'bar' }
    end

    it 'to be { foo: "bar" }' do
      expect({}.reverse_merge(h1)).to eq(h1)
      expect({}.reverse_merge!(h1)).to eq(h1)
    end

    it 'to be { foo: "bar", baz: "boo", boo: "bam" }' do
      h2 = { baz: 'boo', boo: 'bam' }
      h3 = { foo: 'bar', baz: 'boo', boo: 'bam' }

      expect(h1.reverse_merge(h2)).to eq(h3)
      expect(h1.reverse_merge!(h2)).to eq(h3)
    end
  end

  describe '#sample(!)' do
    let(:h1) do
      { a: 1, b: 2, c: 3, d: 4, e: 5 }
    end

    it 'to be true' do
      expect(h1.key?(h1.sample.first)).to eq(true)
    end

    it 'to be false' do
      expect(h1.key?(h1.sample!.first)).to eq(false)
    end
  end

  describe '#sample_key(!)' do
    let(:h1) do
      { a: 1, b: 2, c: 3, d: 4, e: 5 }
    end

    it 'to be true' do
      expect(h1.key?(h1.sample_key)).to eq(true)
    end

    it 'to be false' do
      expect(h1.key?(h1.sample_key!)).to eq(false)
    end
  end

  describe '#sample_value(!)' do
    let(:h1) do
      { a: 1, b: 2, c: 3, d: 4, e: 5 }
    end

    it 'to be true' do
      expect(h1.value?(h1.sample_value)).to eq(true)
    end

    it 'to be false' do
      expect(h1.value?(h1.sample_value!)).to eq(false)
    end
  end

  describe '#shuffle(!)' do
    let(:h1) do
      { a: 1, b: 2, c: 3, d: 4, e: 5, f: 6, g: 7, h: 8, i: 9, j: 10 }
    end

    it 'to be shuffled non-destructively' do
      expect(h1.keys).not_to eq(h1.shuffle.keys)
    end

    it 'to be shuffled destructively' do
      expect(h1.keys).not_to eq(h1.shuffle!.keys)
    end
  end

  describe '#slice(!)' do
    let(:h1) do
      { a: 1, b: 2, c: 3, d: 4 }
    end
    let(:a1) do
      %i[a b]
    end

    it 'to be { a: 1, b: 2 }' do
      h1.slice!(*a1)

      expect(h1).to eq(a: 1, b: 2)
    end
  end

  describe '#stringify_keys(!)' do
    it 'to be { "foo" => "foo", "bar" => "bar" }' do
      h1 = { foo: 'foo', 'bar' => 'bar' }
      h2 = { 'foo' => 'foo', 'bar' => 'bar' }

      expect(h1.stringify_keys).to eq(h2)
      expect(h1.stringify_keys!).to eq(h2)
    end
  end

  describe '#strip(!)' do
    it 'to be nil' do
      expect({}.strip!).to eq(nil)
    end

    it 'to be {}' do
      h1 = { foo: nil, baz: false, boo: '', faz: ' ' }
      h2 = {}

      expect(h2.strip).to eq(h2)
      expect(h1.strip).to eq(h2)
      expect(h1.strip!).to eq(h2)
    end

    it 'to be { foo: "bar", baz: false, boo: nil }' do
      h1 = { foo: 'bar', baz: false, boo: nil, boz: '', faz: ' ' }
      h2 = { foo: 'bar' }

      expect(h1.strip).to eq(h2)
      expect(h1.strip!).to eq(h2)
    end
  end

  describe '#symbolize_keys(!)' do
    it 'to be { foo: "foo", bar: "bar" }' do
      h1 = { foo: 'foo', 'bar' => 'bar' }
      h2 = { foo: 'foo', bar: 'bar' }

      expect(h1.symbolize_keys).to eq(h2)
      expect(h1.symbolize_keys!).to eq(h2)
    end
  end

  describe '#symbolize_and_underscore_keys(!)' do
    it 'to be { foo_bar: "example", baz_bar: "string" }' do
      h1 = { 'foo Bar' => 'example', bazBar: 'string' }
      h2 = { foo_bar: 'example', baz_bar: 'string' }

      expect(h1.symbolize_and_underscore_keys).to eq(h2)
      expect(h1.symbolize_and_underscore_keys!).to eq(h2)
    end
  end

  describe '#to_o' do
    it 'to be OpenStruct' do
      h1 = { foo: { bar: true } }

      expect(h1.to_o.is_a?(OpenStruct)).to eq(true)
    end

    it 'to be true' do
      h1 = { foo: { bar: true } }

      expect(h1.to_o.foo.bar).to eq(true)
    end
  end

  describe '#update_each' do
    it 'to be { "a!" => 1, "b!" => 2 }' do
      h1 = { a: 1, b: 2 }
      h2 = { 'a!' => 2, 'b!' => 3 }

      h1.update_each { |k, v| { "#{k}!" => v + 1 } }

      expect(h1).to eq(h2)
    end
  end

  describe '#update_keys' do
    it 'to be { "a!" => 1, "b!" => 2 }' do
      h1 = { a: 1, b: 2 }
      h2 = { 'a!' => 1, 'b!' => 2 }

      h1.update_keys { |k| "#{k}!" }

      expect(h1).to eq(h2)
    end
  end

  describe '#update_values' do
    it 'to be { a: 2, b: 3 }' do
      h1 = { a: 1, b: 2 }
      h2 = { a: 2, b: 3 }

      h1.update_values { |v| v + 1 }

      expect(h1).to eq(h2)
    end
  end

  describe '#vacant?' do
    it 'to be true' do
      k1 = :foo

      expect({}.vacant?(k1)).to eq(true)
      expect({ foo: nil }.vacant?(k1)).to eq(true)
      expect({ foo: ' ' }.vacant?(k1)).to eq(true)
    end

    it 'to be false' do
      expect({ foo: 'bar' }.vacant?(:foo)).to eq(false)
    end
  end

end
