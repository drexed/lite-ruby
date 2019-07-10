# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Hash do

  describe '#assert_valid_keys' do
    it 'to be {}' do
      expect({}.assert_valid_keys(:foo)).to eq({})
    end

    it 'to be { foo: "bar" }' do
      expect({ foo: 'bar' }.assert_valid_keys(:foo)).to eq(foo: 'bar')
    end

    it 'to raise error' do
      expect { { foo: 'bar', baz: 'boz' }.assert_valid_keys(:foo) }.to raise_error(ArgumentError)
    end
  end

  describe '#assert_valid_keys!' do
    it 'to be {}' do
      expect { {}.assert_valid_keys!(:foo) }.to raise_error(ArgumentError)
    end

    it 'to be { foo: "bar" }' do
      expect({ foo: 'bar' }.assert_valid_keys!(:foo)).to eq(foo: 'bar')
    end

    it 'to raise error' do
      expect { { foo: 'bar', baz: 'boz' }.assert_valid_keys!(:foo) }.to raise_error(ArgumentError)
    end
  end

  describe '#bury' do
    hash = { foo: { baz: 'boo' } }

    it 'to be { foo: :moo }' do
      expect(hash.bury(:foo, :moo)).to eq(foo: :moo)
    end

    it 'to be { foo: { baz: :moo } }' do
      expect(hash.bury(:foo, :baz, :moo)).to eq(foo: { baz: :moo })
    end

    it 'to raise error' do
      expect { hash.bury(:moo) }.to raise_error(ArgumentError)
    end
  end

  describe '#collect_keys' do
    it 'to be ["FOO", "BAZ"]' do
      h1 = { foo: 'bar', baz: 'boo' }
      array = %w[FOO BAZ]

      expect(h1.collect_keys { |k| k.to_s.upcase }).to eq(array)
    end
  end

  describe '#collect_values' do
    it 'to be ["BAR", "BOO"]' do
      h1 = { foo: 'bar', baz: 'boo' }
      array = %w[BAR BOO]

      expect(h1.collect_values { |k| k.to_s.upcase }).to eq(array)
    end
  end

  describe '#compact(!)' do
    it 'to be nil' do
      expect({}.compact!).to eq(nil)
    end

    it 'to be {}' do
      h1 = { foo: nil }
      hash_two = {}

      expect(hash_two.compact).to eq(hash_two)
      expect(h1.compact).to eq(hash_two)
      expect(h1.compact!).to eq(hash_two)
    end

    it 'to be { foo: "bar", baz: false, boo: nil }' do
      h1 = { foo: 'bar', baz: false, boo: nil }
      hash_two = { foo: 'bar', baz: false }

      expect(h1.compact).to eq(hash_two)
      expect(h1.compact!).to eq(hash_two)
    end
  end

  describe '#deep_dup(!)' do
    it 'to be { a: false, b: { c: [1, 2, 3], x: [3, 4, 5] } }' do
      hash = { a: true, b: { c: [1, 2, 3] } }
      hash_two = { a: false, b: { x: [3, 4, 5] } }
      hash_three = { a: false, b: { c: [1, 2, 3], x: [3, 4, 5] } }

      expect(hash.deep_merge(hash_two)).to eq(hash_three)
      expect(hash.deep_merge!(hash_two)).to eq(hash_three)
    end
  end

  describe '#demote(!)' do
    hash = { a: 0, b: 1, c: 2 }

    it 'to be { a: 0, c: 2, b: 1 }' do
      expect(hash.demote(:b)).to eq(a: 0, c: 2, b: 1)
    end

    it 'to be { a: 0, b: 1, c: 2 }' do
      expect(hash.demote!(:d)).to eq(hash)
    end
  end

  describe '#denillify(!)' do
    it 'to be { abc: 0, xyz: 1 }' do
      hash = { abc: nil, xyz: 1 }
      hash_two = { abc: 0, xyz: 1 }

      expect(hash.denillify).to eq(hash_two)
      expect(hash.denillify!).to eq(hash_two)
    end

    it 'to be { abc: 9, xyz: 1 }' do
      hash = { abc: nil, xyz: 1 }
      hash_two = { abc: 9, xyz: 1 }

      expect(hash.denillify(9)).to eq(hash_two)
      expect(hash.denillify!(9)).to eq(hash_two)
    end
  end

  describe '#dig' do
    hash = { a: { b: { c: :d } } }

    it 'to be { c: :d }' do
      expect(hash.dig(:a, :b)).to eq(c: :d)
    end

    it 'to be :d' do
      expect(hash.dig(:a, :b, :c)).to eq(:d)
    end
  end

  describe '#except(!)' do
    it 'to be {}' do
      h1 = {}
      key = :foo

      expect(h1.except(key)).to eq(h1)
      expect(h1.except!(key)).to eq(h1)
    end

    it 'to be { :foo => 1 }' do
      h1 = { foo: 1, baz: 2, bar: 3 }
      hash_two = { foo: 1 }
      array = [:baz, :bar]

      expect(h1.except(*array)).to eq(hash_two)
      expect(h1.except!(*array)).to eq(hash_two)
    end

    it 'to be { :baz => 2, :bar => 3 }' do
      h1 = { foo: 1, baz: 2, bar: 3 }
      hash_two = { baz: 2, bar: 3 }
      key = :foo

      expect(h1.except(key)).to eq(hash_two)
      expect(h1.except!(key)).to eq(hash_two)
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
      hash_two = { a: 4, b: 5, c: 6 }

      expect(h1.hmap { |k, v| { k => v + 3 } }).to eq(hash_two)
      expect(h1.hmap! { |k, v| { k => v + 3 } }).to eq(hash_two)
    end
  end

  describe '#nillify' do
    it 'to be {a: 1, b: "test", c: nil, d: nil, e: nil, f: nil}' do
      h1 = { a: 1, b: 'test', c: nil, d: false, e: '', f: ' ' }
      hash_two = { a: 1, b: 'test', c: nil, d: nil, e: nil, f: nil }

      expect(h1.nillify).to eq(hash_two)
      expect(h1.nillify!).to eq(hash_two)
    end
  end

  describe '#only(!)' do
    it 'to be {}' do
      h1 = {}
      key = :foo

      expect(h1.only(key)).to eq(h1)
      expect(h1.only!(key)).to eq(h1)
    end

    it 'to be { :foo => 1 }' do
      h1 = { foo: 1, baz: 2, bar: 3 }
      hash_two = { foo: 1 }
      key = :foo

      expect(h1.only(key)).to eq(hash_two)
      expect(h1.only!(key)).to eq(hash_two)
    end

    it 'to be { :baz => 2, :bar => 3 }' do
      h1 = { foo: 1, baz: 2, bar: 3 }
      hash_two = { baz: 2, bar: 3 }
      array = [:baz, :bar]

      expect(h1.only(*array)).to eq(hash_two)
      expect(h1.only!(*array)).to eq(hash_two)
    end
  end

  describe '#only_fill(!)' do
    it 'to be { foo: nil }' do
      hash = {}
      hash_two = {foo: nil}
      key = :foo

      expect(hash.only_fill(key)).to eq(hash_two)
      expect(hash.only_fill!(key)).to eq(hash_two)
    end

    it 'to be { foo: 0 }' do
      h1 = {}
      hash_two = { foo: 0 }
      array = [:foo, placeholder: 0]

      expect(h1.only_fill(*array)).to eq(hash_two)
      expect(h1.only_fill!(*array)).to eq(hash_two)
    end

    it 'to be { :foo => 1 }' do
      h1 = { foo: 1, baz: 2 }
      hash_two = { foo: 1, bar: nil }
      array = [:foo, :bar]

      expect(h1.only_fill(*array)).to eq(hash_two)
      expect(h1.only_fill!(*array)).to eq(hash_two)
    end
  end

  describe '#pair?' do
    hash = { a: 1 }

    it 'to be true' do
      expect(hash.pair?(:a, 1)).to eq(true)
    end

    it 'to be false' do
      expect(hash.pair?(:a, 2)).to eq(false)
    end
  end

  describe '#promote(!)' do
    hash = { a: 0, b: 1, c: 2 }

    it 'to be { b: 1, a: 0, c: 2 }' do
      expect(hash.promote(:b)).to eq(b: 1, a: 0, c: 2)
    end

    it 'to be { a: 0, b: 1, c: 2 }' do
      expect(hash.promote!(:d)).to eq(hash)
    end
  end

  describe '#rename_keys(!)' do
    it 'to be [:baz, :bar]' do
      h1 = { foo: 'foo', baz: 'baz' }
      hash_two = { foo: :bar }
      array = %i[baz bar]

      expect(h1.rename_keys(hash_two).keys).to eq(array)
      expect(h1.rename_keys!(hash_two).keys).to eq(array)
    end

    it 'to be [:foo, "tick"]' do
      h1 = { foo: 'foo', 'baz' => 'baz' }
      hash_two = { 'baz' => 'tick' }
      array = [:foo, 'tick']

      expect(h1.rename_keys(hash_two).keys).to eq(array)
      expect(h1.rename_keys!(hash_two).keys).to eq(array)
    end

    it 'to be [:bar, :tick]' do
      h1 = { foo: 'foo', baz: 'baz' }
      hash_two = { foo: :bar, baz: :tick }
      array = %i[bar tick]

      expect(h1.rename_keys(hash_two).keys).to eq(array)
      expect(h1.rename_keys!(hash_two).keys).to eq(array)
    end

    it 'to be [:bar, "tick"]' do
      h1 = { foo: 'foo', 'baz' => 'baz' }
      hash_two = { foo: :bar, 'baz' => 'tick' }
      array = [:bar, 'tick']

      expect(h1.rename_keys(hash_two).keys).to eq(array)
      expect(h1.rename_keys!(hash_two).keys).to eq(array)
    end
  end

  describe '#reverse_merge(!)' do
    it 'to be { foo: "bar" }' do
      hash = { foo: 'bar' }

      expect({}.reverse_merge(hash)).to eq(hash)
      expect({}.reverse_merge!(hash)).to eq(hash)
    end

    it 'to be { foo: "bar", baz: "boo", boo: "bam" }' do
      h1 = { foo: 'bar' }
      hash_two = { baz: 'boo', boo: 'bam' }
      hash_three = { foo: 'bar', baz: 'boo', boo: 'bam' }

      expect(h1.reverse_merge(hash_two)).to eq(hash_three)
      expect(h1.reverse_merge!(hash_two)).to eq(hash_three)
    end
  end

  describe '#sample(!)' do
    hash = { a: 1, b: 2, c: 3, d: 4, e: 5 }

    it 'to be true' do
      expect(hash.key?(hash.sample.first)).to eq(true)
    end

    it 'to be false' do
      expect(hash.key?(hash.sample!.first)).to eq(false)
    end
  end

  describe '#sample_key(!)' do
    hash = { a: 1, b: 2, c: 3, d: 4, e: 5 }

    it 'to be true' do
      expect(hash.key?(hash.sample_key)).to eq(true)
    end

    it 'to be false' do
      expect(hash.key?(hash.sample_key!)).to eq(false)
    end
  end

  describe '#sample_value(!)' do
    hash = { a: 1, b: 2, c: 3, d: 4, e: 5 }

    it 'to be true' do
      expect(hash.value?(hash.sample_value)).to eq(true)
    end

    it 'to be false' do
      expect(hash.value?(hash.sample_value!)).to eq(false)
    end
  end

  describe '#shuffle(!)' do
    hash = { a: 1, b: 2, c: 3, d: 4, e: 5 }

    it 'to not be { a: 1, b: 2, c: 3, d: 4, e: 5 }' do
      expect(hash.keys).not_to eq(hash.shuffle.keys)
    end

    it 'to be { a: 1, b: 2, c: 3, d: 4, e: 5 }' do
      expect(hash.keys).not_to eq(hash.shuffle!.keys)
    end
  end

  describe '#slice(!)' do
    hash = { a: 1, b: 2, c: 3, d: 4 }
    key = [:a, :b]

    it 'to be { a: 1, b: 2 }' do
      expect(hash.slice(*key)).to eq(a: 1, b: 2)
    end

    it 'to be { a: 3, b: 4 }' do
      expect(hash.slice!(*key)).to eq(c: 3, d: 4)
    end
  end

  describe '#stringify_keys(!)' do
    it 'to be { "foo" => "foo", "bar" => "bar" }' do
      h1 = { foo: 'foo', 'bar' => 'bar' }
      hash_two = { 'foo' => 'foo', 'bar' => 'bar' }

      expect(h1.stringify_keys).to eq(hash_two)
      expect(h1.stringify_keys!).to eq(hash_two)
    end
  end

  describe '#strip(!)' do
    it 'to be nil' do
      expect({}.strip!).to eq(nil)
    end

    it 'to be {}' do
      hash = { foo: nil, baz: false, boo: '', faz: ' ' }
      hash_two = {}

      expect(hash_two.strip).to eq(hash_two)
      expect(hash.strip).to eq(hash_two)
      expect(hash.strip!).to eq(hash_two)
    end

    it 'to be { foo: "bar", baz: false, boo: nil }' do
      h1 = { foo: 'bar', baz: false, boo: nil, boz: '', faz: ' ' }
      hash_two = { foo: 'bar' }

      expect(h1.strip).to eq(hash_two)
      expect(h1.strip!).to eq(hash_two)
    end
  end

  describe '#symbolize_keys(!)' do
    it 'to be { foo: "foo", bar: "bar" }' do
      h1 = { foo: 'foo', 'bar' => 'bar' }
      hash_two = { foo: 'foo', bar: 'bar' }

      expect(h1.symbolize_keys).to eq(hash_two)
      expect(h1.symbolize_keys!).to eq(hash_two)
    end
  end

  describe '#symbolize_and_underscore_keys(!)' do
    it 'to be { foo_bar: "example", baz_bar: "string" }' do
      h1 = { 'foo Bar' => 'example', bazBar: 'string' }
      hash_two = { foo_bar: 'example', baz_bar: 'string' }

      expect(h1.symbolize_and_underscore_keys).to eq(hash_two)
      expect(h1.symbolize_and_underscore_keys!).to eq(hash_two)
    end
  end

  describe '#to_o' do
    it 'to be OpenStruct' do
      hash = { foo: { bar: true } }

      expect(hash.to_o.is_a?(OpenStruct)).to eq(true)
    end

    it 'to be true' do
      hash = { foo: { bar: true } }

      expect(hash.to_o.foo.bar).to eq(true)
    end
  end

  describe '#transform_keys(!)' do
    it 'to be { "FOO" => "foo", "BAZ" => "bar" }' do
      h1 = { foo: 'bar', baz: 'boo' }
      hash_two = { 'FOO' => 'bar', 'BAZ' => 'boo' }

      expect(h1.transform_keys { |k| k.to_s.upcase }).to eq(hash_two)
      expect(h1.transform_keys! { |k| k.to_s.upcase }).to eq(hash_two)
    end
  end

  describe '#transform_values(!)' do
    it 'to be { foo: "BAR", baz: "BOO" }' do
      h1 = { foo: 'bar', baz: 'boo' }
      hash_two = { foo: 'BAR', baz: 'BOO' }

      expect(h1.transform_values { |v| v.to_s.upcase }).to eq(hash_two)
      expect(h1.transform_values! { |v| v.to_s.upcase }).to eq(hash_two)
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
