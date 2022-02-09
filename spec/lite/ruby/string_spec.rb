# frozen_string_literal: false

require 'spec_helper'

RSpec.describe String do

  describe '#acronym(!)' do
    it 'to be "es"' do
      s1 = 'example string'
      s2 = 'es'

      expect(s1.acronym).to eq(s2)
      expect(s1.acronym!).to eq(s2)
    end
  end

  describe '#any?' do
    let(:s1) { 'example string' }

    it 'to be true' do
      expect(s1.any?('example')).to eq(true)
      expect(s1.any?('foo', 'string')).to eq(true)
    end

    it 'to be false' do
      expect(s1.any?('foo')).to eq(false)
      expect(s1.any?('foo', 'bar')).to eq(false)
    end
  end

  describe '#at' do
    let(:s1) { 'example' }

    it 'to be "e"' do
      expect(s1.at(0)).to eq('e')
      expect(s1.at(-1)).to eq('e')
    end

    it 'to be "m"' do
      expect(s1.at(3)).to eq('m')
    end

    it 'to be "xam"' do
      expect(s1.at(1..3)).to eq('xam')
    end

    it 'to be ""' do
      expect(s1.at(7..-1)).to eq('')
    end

    it 'to be "pl"' do
      expect(s1.at('pl')).to eq('pl')
      expect(s1.at(/pl/)).to eq('pl')
    end

    it 'to be nil' do
      expect(s1.at('xp')).to eq(nil)
      expect(s1.at(/xp/)).to eq(nil)
    end
  end

  describe '#camelize(!)' do
    let(:s1) { 'example_string' }

    it 'to be "ExampleString"' do
      s2 = 'ExampleString'

      expect(s1.camelize).to eq(s2)
      expect(s1.camelcase).to eq(s2)
      expect(s1.camelize!).to eq(s2)
      expect(s1.camelcase!).to eq(s2)
    end

    it 'to be "exampleString"' do
      s2 = 'exampleString'
      k1 = :lower

      expect(s1.camelize(k1)).to eq(s2)
      expect(s1.camelcase(k1)).to eq(s2)
      expect(s1.camelize!(k1)).to eq(s2)
      expect(s1.camelcase!(k1)).to eq(s2)
    end
  end

  describe '#capitalized?' do
    it 'to be true' do
      expect('Downcase'.capitalized?).to eq(true)
      expect('Downcase string'.capitalized?).to eq(true)
    end

    it 'to be false' do
      expect('UPCASED'.capitalized?).to eq(false)
      expect('downcase'.capitalized?).to eq(false)
      expect('downcase string'.capitalized?).to eq(false)
      expect('Downcase String'.capitalized?).to eq(false)
    end
  end

  describe '#classify' do
    it 'to be "ExampleString"' do
      s1 = 'example_string'
      s2 = 'ExampleString'

      expect(s1.classify).to eq(s2)
      expect(s1.classify!).to eq(s2)
    end

    it 'to be "ExampleString::Test"' do
      s1 = 'example_string/test'
      s2 = 'ExampleString::Test'

      expect(s1.classify).to eq(s2)
      expect(s1.classify!).to eq(s2)
    end

    it 'to be "Test"' do
      s1 = 'example_string.test'
      s2 = 'Test'

      expect(s1.classify).to eq(s2)
      expect(s1.classify!).to eq(s2)
    end
  end

  describe '#constantize' do
    it 'to be a String object' do
      expect('String'.constantize).to eq(described_class)
    end
  end

  describe '#deconstantize' do
    it 'to be "String"' do
      s1 = 'String'
      s2 = '::String'
      s3 = ''

      expect(s1.deconstantize).to eq(s3)
      expect(s1.deconstantize!).to eq(s3)
      expect(s2.deconstantize).to eq(s3)
      expect(s2.deconstantize!).to eq(s3)
      expect(s3.deconstantize).to eq(s3)
      expect(s3.deconstantize!).to eq(s3)
    end

    it 'to be "String" with leading word' do
      s1 = 'Example::String'
      s2 = 'Example'

      expect(s1.deconstantize).to eq(s2)
      expect(s1.deconstantize!).to eq(s2)
    end

    it 'to be "String" with leading "::"' do
      s1 = '::Example::String'
      s2 = '::Example'

      expect(s1.deconstantize).to eq(s2)
      expect(s1.deconstantize!).to eq(s2)
    end
  end

  describe '#dedupe(!)' do
    it 'to be "/crazy/concatenated/file/path"' do
      s1 = '/foo//bar////baz/bing'
      s2 = '/foo/bar/baz/bing'
      s3 = '/'

      expect(s1.dedupe(s3)).to eq(s2)
      expect(s1.dedupe!(s3)).to eq(s2)
    end

    it 'to be "foo_bar_baz-bing"' do
      s1 = 'foo___bar_baz---bing'
      s2 = 'foo_bar_baz-bing'
      s3 = '-_'

      expect(s1.dedupe(s3)).to eq(s2)
      expect(s1.dedupe!(s3)).to eq(s2)
    end
  end

  describe '#demodulize' do
    it 'to be "String"' do
      s1 = 'Example::String'
      s2 = 'String'

      expect(s1.demodulize).to eq(s2)
      expect(s1.demodulize!).to eq(s2)
      expect(s2.demodulize).to eq(s2)
      expect(s2.demodulize!).to eq(s2)
    end
  end

  describe '#dasherize' do
    it 'to be "example-string"' do
      s1 = 'example_string'
      s2 = 'example-string'

      expect(s1.dasherize).to eq(s2)
      expect(s1.dasherize!).to eq(s2)
    end
  end

  describe '#domain' do
    let(:s1) { 'http://www.example.com' }

    it 'to be nil' do
      expect(''.domain).to eq(nil)
      expect(' '.domain).to eq(nil)
      expect('example string'.domain).to eq(nil)
      expect('www.example.com'.domain).to eq(nil)
    end

    it 'to be "http://www.example.com"' do
      expect(s1.domain).to eq(s1)
      expect('http://www.example.com'.domain).to eq(s1)
      expect('http://www.example.com/fake-page'.domain).to eq(s1)
    end
  end

  describe '#downcase?' do
    it 'to be true' do
      expect('downcase'.downcase?).to eq(true)
      expect('downcase string'.downcase?).to eq(true)
    end

    it 'to be false' do
      expect('Mixedcase'.downcase?).to eq(false)
      expect('UPCASE'.downcase?).to eq(false)
    end
  end

  describe '#each_word' do
    it 'to be [ ... ]' do
      s1 = 'example string'
      a2 = %w[Example String]

      expect(s1.each_word(&:capitalize!)).to eq(a2)
    end
  end

  describe '#ellipsize' do
    let(:s1) { '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ' }

    it 'to be "0123...WXYZ"' do
      expect(s1.ellipsize(30)).to eq('0123...WXYZ')
    end

    it 'to be "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"' do
      expect(s1.ellipsize(50)).to eq(s1)
    end

    it 'to be "012...XYZ"' do
      expect(s1.ellipsize(30, offset: 3)).to eq('012...XYZ')
    end

    it 'to be "0123+++WXYZ"' do
      expect(s1.ellipsize(30, separator: '+++')).to eq('0123+++WXYZ')
    end
  end

  describe '#first' do
    let(:s1) { 'example' }

    it 'to be "e"' do
      expect(s1.first).to eq('e')
    end

    it 'to be ""' do
      expect(s1.first(0)).to eq('')
    end

    it 'to be "exa"' do
      expect(s1.first(3)).to eq('exa')
    end
  end

  # rubocop:disable Style/FormatStringToken
  describe '#format' do
    it 'to be "example string"' do
      expect('example %s'.format('string')).to eq('example string')
    end

    it 'to be "test example string"' do
      s1 = 'test %{one} %{two}'
      s2 = 'test example string'

      expect(s1.format(one: 'example', two: 'string')).to eq(s2)
    end

    it 'to be "1 + 2"' do
      expect('%d + %d'.format([1, 2])).to eq('1 + 2')
    end
  end
  # rubocop:enable Style/FormatStringToken

  describe '#fragment' do
    let(:s1) { 'time=1305298413' }

    it 'to be nil' do
      expect(s1.fragment).to eq(nil)
      expect(''.fragment).to eq(nil)
      expect(' '.fragment).to eq(nil)
      expect('example string'.fragment).to eq(nil)
    end

    it 'to be "time=1305298413"' do
      expect('http://www.example.com/fake-page?id=30&limit=5#time=1305298413'.fragment).to eq(s1)
    end
  end

  describe '#from' do
    let(:s1) { 'example' }

    it 'to be "example"' do
      expect(s1.from(0)).to eq(s1)
    end

    it 'to be "mple"' do
      expect(s1.from(3)).to eq('mple')
    end
  end

  describe '#headerize(!)' do
    it 'to be "Example Test-sample"' do
      s1 = ' example test-sample '
      s2 = 'Example Test-sample'

      expect(s1.headerize).to eq(s2)
      expect(s1.headerize!).to eq(s2)
    end
  end

  describe '#host' do
    let(:s1) { 'www.example.com' }

    it 'to be nil' do
      expect(s1.host).to eq(nil)
      expect(''.host).to eq(nil)
      expect(' '.host).to eq(nil)
      expect('example string'.host).to eq(nil)
    end

    it 'to be "www.example.com"' do
      expect('http://www.example.com'.host).to eq(s1)
      expect('http://www.example.com/fake-page'.host).to eq(s1)
    end
  end

  describe '#humanize(!)' do
    it 'to be "Example string test"' do
      s1 = 'example_string_test'
      s2 = 'Example string test'

      expect(s1.humanize).to eq(s2)
      expect(s1.humanize!).to eq(s2)
    end

    it 'to be "example string test"' do
      s1 = 'example_string_test'
      s2 = 'example string test'

      expect(s1.humanize(capitalize: false)).to eq(s2)
      expect(s1.humanize!(capitalize: false)).to eq(s2)
    end
  end

  describe '#indent(!)' do
    let(:s1) { 'example' }
    let(:n1) { 2 }

    it 'to be "  example"' do
      s2 = '  example'

      expect(s1.indent(n1)).to eq(s2)
      expect(s1.indent!(n1)).to eq(s2)
    end

    it 'to be "\t\texample"' do
      s2 = '\t\texample'
      s3 = '\t'

      expect(s1.indent(n1, s3)).to eq(s2)
      expect(s1.indent!(n1, s3)).to eq(s2)
    end
  end

  describe '#index_all' do
    it 'to be [0, 7, 13]' do
      expect('012324507654301243'.index_all(0)).to eq([0, 7, 13])
    end

    it 'to be [0, 13, 31]' do
      expect('the apple is the best fruit in the world'.index_all('the')).to eq([0, 13, 31])
    end

    it 'to be [1, 5, 9]' do
      expect('asdfasdfasdf'.index_all(/sd/)).to eq([1, 5, 9])
    end
  end

  describe '#labelize(!)' do
    it 'to be "Example string test"' do
      s1 = 'example_string_test'
      s2 = 'exampleStringTest'
      s3 = 'ExampleStringTest'
      s4 = 'Example string test'

      expect(s1.labelize).to eq(s4)
      expect(s1.labelize!).to eq(s4)
      expect(s2.labelize).to eq(s4)
      expect(s2.labelize!).to eq(s4)
      expect(s3.labelize).to eq(s4)
      expect(s3.labelize!).to eq(s4)
    end

    it 'to be "Example string test Id"' do
      s1 = '_example_string_test_id'
      s2 = 'Example string test ID'

      expect(s1.labelize).to eq(s2)
      expect(s1.labelize!).to eq(s2)
    end
  end

  describe '#last' do
    let(:s1) { 'example' }

    it 'to be "e"' do
      expect(s1.last).to eq('e')
    end

    it 'to be ""' do
      expect(s1.last(0)).to eq('')
    end

    it 'to be "ple"' do
      expect(s1.last(3)).to eq('ple')
    end
  end

  describe '#lchomp(!)' do
    it 'to be "xample"' do
      s1 = 'example'
      s2 = 'xample'
      s3 = 'e'

      expect(s1.lchomp(s3)).to eq(s2)
      expect(s1.lchomp!(s3)).to eq(s2)
    end

    it 'to be "example"' do
      s1 = 'example'
      s2 = 'z'

      expect(s1.lchomp(s2)).to eq(s1)
      expect(s1.lchomp!(s2)).to eq(s1)
    end
  end

  describe '#methodize(!)' do
    it 'to be "example__class_string"' do
      s1 = 'Example::ClassString'
      s2 = 'example__class_string'

      expect(s1.methodize).to eq(s2)
      expect(s1.methodize!).to eq(s2)
    end
  end

  describe '#modulize(!)' do
    it 'to be "ExampleString"' do
      s1 = 'example_string'
      s2 = 'ExampleString'

      expect(s1.modulize).to eq(s2)
      expect(s1.modulize!).to eq(s2)
    end

    it 'to be "Example::String"' do
      s1 = 'example/string'
      s2 = 'Example::String'

      expect(s1.modulize).to eq(s2)
      expect(s1.modulize!).to eq(s2)
    end
  end

  describe '#mixedcase?' do
    it 'to be true' do
      expect('Mixedcase'.mixedcase?).to eq(true)
    end

    it 'to be false' do
      expect('downcase'.mixedcase?).to eq(false)
      expect('UPCASE'.mixedcase?).to eq(false)
    end
  end

  describe '#non_possessive(!)' do
    it 'to be "test" for "test\'s"' do
      s1 = "test's"
      s2 = 'test'

      expect(s1.non_possessive).to eq(s2)
      expect(s1.non_possessive!).to eq(s2)
    end

    it 'to be "test" for "tests\'"' do
      s1 = "tests'"
      s2 = 'tests'

      expect(s1.non_possessive).to eq(s2)
      expect(s1.non_possessive!).to eq(s2)
    end
  end

  describe '#ordinal' do
    it 'to be "st"' do
      expect('1'.ordinal).to eq('st')
    end

    it 'to be "nd"' do
      expect('2'.ordinal).to eq('nd')
    end

    it 'to be "rd"' do
      expect('3'.ordinal).to eq('rd')
    end

    it 'to be "th"' do
      expect('11'.ordinal).to eq('th')
    end
  end

  describe '#ordinalize' do
    it 'to be "st"' do
      expect('1'.ordinalize).to eq('1st')
    end

    it 'to be "nd"' do
      expect('2'.ordinalize).to eq('2nd')
    end

    it 'to be "rd"' do
      expect('3'.ordinalize).to eq('3rd')
    end

    it 'to be "th"' do
      expect('11'.ordinalize).to eq('11th')
    end
  end

  describe '#parameterize(!)' do
    let(:s1) { 'example string' }

    it 'to be "example-string"' do
      s2 = 'example-string'

      expect(s1.parameterize).to eq(s2)
      expect(s1.parameterize!).to eq(s2)
    end

    it 'to be "example_string"' do
      s2 = 'example?string'
      s3 = '?'

      expect(s1.parameterize(separator: s3)).to eq(s2)
      expect(s1.parameterize!(separator: s3)).to eq(s2)
    end
  end

  describe '#path' do
    let(:s1) { '/fake-page' }

    it 'to be nil' do
      expect(''.path).to eq(nil)
      expect(' '.path).to eq(nil)
      expect('example string'.path).to eq(nil)
    end

    it 'to be "/fake-page"' do
      expect(s1.path).to eq(s1)
      expect('http://www.example.com/fake-page?id=30&limit=5#time=1305298413'.path).to eq(s1)
    end
  end

  describe '#pathize(!)' do
    it 'to be "example-string"' do
      s1 = 'ExampleString::Class'
      s2 = 'example_string/class'

      expect(s1.pathize).to eq(s2)
      expect(s1.pathize!).to eq(s2)
    end
  end

  describe '#pollute(!)' do
    let(:s1) { 'test' }

    it 'to be "t^--^--^e^--^--^s^--^--^t^--^--^"' do
      s2 = 't^--^--^e^--^--^s^--^--^t^--^--^'

      expect(s1.pollute).to eq(s2)
      expect(s1.pollute!).to eq(s2)
    end

    it 'to be "t-e-s-t-"' do
      s2 = 't-e-s-t-'
      s3 = '-'

      expect(s1.pollute(s3)).to eq(s2)
      expect(s1.pollute!(s3)).to eq(s2)
    end
  end

  describe '#pop' do
    it 'to be "r"' do
      expect('tester'.pop).to eq('r')
    end
  end

  describe '#possessive(!)' do
    it 'to be "test\'s"' do
      s1 = 'test'
      s2 = "test's"

      expect(s1.possessive).to eq(s2)
      expect(s1.possessive!).to eq(s2)
    end

    it 'to be "tests\'"' do
      s1 = 'tests'
      s2 = "tests'"

      expect(s1.possessive).to eq(s2)
      expect(s1.possessive!).to eq(s2)
    end
  end

  describe '#possessive?' do
    let(:s1) { 'example string' }

    it 'to be true' do
      expect("test's".possessive?).to eq(true)
      expect("tests'".possessive?).to eq(true)
    end

    it 'to be false' do
      expect('test'.possessive?).to eq(false)
    end
  end

  describe '#push' do
    it 'to be "tester"' do
      expect('test'.push('er')).to eq('tester')
    end
  end

  describe '#query' do
    let(:s1) { 'id=30&limit=5' }

    it 'to be nil' do
      expect(s1.query).to eq(nil)
      expect(''.query).to eq(nil)
      expect(' '.query).to eq(nil)
      expect('example string'.query).to eq(nil)
    end

    it 'to be "id=30&limit=5"' do
      expect('http://www.example.com/fake-page?id=30&limit=5#time=1305298413'.query).to eq(s1)
    end
  end

  describe '#quote(!)' do
    it 'to be "example" with double quotes' do
      s1 = 'example'
      s2 = '"example"'

      expect(s1.quote).to eq(s2)
      expect(s1.quote!).to eq(s2)
    end

    it 'to be "example" with single quotes' do
      s1 = 'example'
      s2 = "'example'"
      n1 = 1

      expect(s1.quote(n1)).to eq(s2)
      expect(s1.quote!(n1)).to eq(s2)
    end

    it 'to be "example" with backticks' do
      s1 = 'example'
      s2 = '`example`'
      k1 = :backtick

      expect(s1.quote(k1)).to eq(s2)
      expect(s1.quote!(k1)).to eq(s2)
    end
  end

  describe '#remove(!)' do
    it 'to be "this  that "' do
      s1 = 'this thing that thing'
      s2 = 'this thing that them'
      s3 = 'thing'
      s4 = 'them'
      s5 = 'this  that '

      expect(s1.remove(s3)).to eq(s5)
      expect(s1.remove!(s3)).to eq(s5)
      expect(s2.remove(s3, s4)).to eq(s5)
      expect(s2.remove!(s3, s4)).to eq(s5)
    end
  end

  describe '#remove_tags(!)' do
    it 'to be "example"' do
      s1 = 'example'

      expect(s1.remove_tags).to eq(s1)
      expect(s1.remove_tags!).to eq(s1)
    end

    it 'to be "click"' do
      s1 = '<a href="http://example.com">click</a>'
      s2 = 'click'

      expect(s1.remove_tags).to eq(s2)
      expect(s1.remove_tags!).to eq(s2)
    end

    it 'to be "this is bold and emphatic"' do
      s1 = 'this is <b>bold</b> and <em>emphatic</em>'
      s2 = 'this is bold and emphatic'

      expect(s1.remove_tags).to eq(s2)
      expect(s1.remove_tags!).to eq(s2)
    end
  end

  describe '#rotate(!)' do
    it 'to be "xamplee"' do
      s1 = 'example'
      s2 = 'xamplee'

      expect(s1.rotate).to eq(s2)
      expect(s1.rotate!).to eq(s2)
    end

    it 'to be "ampleex"' do
      s1 = 'example'
      s2 = 'ampleex'

      expect(s1.rotate(2)).to eq(s2)
      expect(s1.rotate!(2)).to eq(s2)
    end
  end

  describe '#safe_encode(!)' do
    let(:s1) { '中文123' }
    let(:s2) { 'ASCII' }

    it 'to be "123"' do
      s3 = '123'

      expect(s1.safe_encode(s2)).to eq(s3)
      expect(s1.safe_encode!(s2)).to eq(s3)
    end

    it 'to be "xx123"' do
      s3 = 'xx123'
      s4 = 'x'

      expect(s1.safe_encode(s2, s4)).to eq(s3)
      expect(s1.safe_encode!(s2, s4)).to eq(s3)
    end
  end

  describe '#sample(!)' do
    it 'to be true' do
      s1 = 'this thing that thing'

      expect(s1.include?(s1.sample)).to eq(true)
      expect(s1.include?(s1.sample!)).to eq(true)
    end
  end

  describe '#shift(!)' do
    let(:s1) { 'this thing that thing' }

    it 'to be "t"' do
      s2 = 't'

      expect(s1.shift).to eq(s2)
      expect(s1.shift!).to eq(s2)
    end

    it 'to be "this  that thing"' do
      s2 = 'this  that thing'
      s3 = 'thing'

      expect(s1.shift(s3)).to eq(s2)
      expect(s1.shift!(s3)).to eq(s2)
    end

    it 'to be " thing  thing"' do
      s1 = ' thing  thing'
      a1 = %w[this that]

      expect(s1.shift(*a1)).to eq(s1)
      expect(s1.shift!(*a1)).to eq(s1)
    end
  end

  describe '#shuffle(!)' do
    it 'to not be "this thing that thing"' do
      s1 = 'this thing that thing'

      expect(s1.shuffle).not_to eq(s1)
      expect(s1.shuffle!).not_to eq('this thing that thing')
    end
  end

  describe '#sift(!)' do
    it 'to be "23456789"' do
      s1 = 'qa2ws3ed4rf5tg6yh7uj8ik9ol'
      s2 = '0123456789'
      s3 = '23456789'
      r1 = (0..9)
      a1 = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

      expect(s1.sift(s2)).to eq(s3)
      expect(s1.sift!(s2)).to eq(s3)
      expect(s1.sift(r1)).to eq(s3)
      expect(s1.sift!(r1)).to eq(s3)
      expect(s1.sift(a1)).to eq(s3)
      expect(s1.sift!(a1)).to eq(s3)
    end
  end

  describe '#slugify(!)' do
    it 'to be "example"' do
      s1 = 'example'

      expect(s1.slugify).to eq(s1)
      expect(s1.slugify!).to eq(s1)
    end

    it 'to be "example-string"' do
      s1 = 'example string'
      s2 = 'example-string'

      expect(s1.slugify).to eq(s2)
      expect(s1.slugify!).to eq(s2)
    end

    it 'to be "example-string-test"' do
      s1 = 'Example string @@@ test!'
      s2 = 'example-string-test'

      expect(s1.slugify).to eq(s2)
      expect(s1.slugify!).to eq(s2)
    end

    it 'to be "a-real-doozie"' do
      s1 = ' A REal Doozi\'e?  \' '
      s2 = 'a-real-doozie'

      expect(s1.slugify).to eq(s2)
      expect(s1.slugify!).to eq(s2)
    end
  end

  describe '#sort(!)' do
    it 'to be "abcde"' do
      s1 = 'adbec'
      s2 = 'abcde'

      expect(s1.sort).to eq(s2)
      expect(s1.sort!).to eq(s2)
    end
  end

  describe '#scheme' do
    let(:s1) { 'http' }

    it 'to be nil' do
      expect(s1.scheme).to eq(nil)
      expect(''.scheme).to eq(nil)
      expect(' '.scheme).to eq(nil)
      expect('example string'.scheme).to eq(nil)
    end

    it 'to be "http"' do
      expect('http://www.example.com/fake-page?id=30&limit=5#time=1305298413'.scheme).to eq(s1)
    end
  end

  describe '#squish(!)' do
    it 'to be example test' do
      s1 = 'example test'

      expect('example     test'.squish).to eq(s1)
      expect("example  \n   \t   test".squish!).to eq(s1)
      expect("  example  \n   \t   test  ".squish).to eq(s1)
      expect('  example     test  '.squish!).to eq(s1)
    end
  end

  describe '#titleize(!)' do
    it 'to be "Example String Test"' do
      s1 = 'example string test'
      s2 = 'Example string Test'
      s3 = 'ExampleStringTest'
      s4 = 'Example_string_test'
      s5 = 'Example String Test'

      expect(s1.titleize).to eq(s5)
      expect(s1.titlecase).to eq(s5)
      expect(s1.titleize!).to eq(s5)
      expect(s1.titlecase!).to eq(s5)
      expect(s2.titleize).to eq(s5)
      expect(s2.titleize!).to eq(s5)
      expect(s3.titleize).to eq(s5)
      expect(s3.titleize!).to eq(s5)
      expect(s4.titleize).to eq(s5)
      expect(s4.titleize!).to eq(s5)
    end
  end

  describe '#to' do
    let(:s1) { 'example' }

    it 'to be "e"' do
      expect(s1.to(0)).to eq('e')
    end

    it 'to be "exampl"' do
      expect(s1.to(-2)).to eq('exampl')
    end

    it 'to be "exam"' do
      expect(s1.to(3)).to eq('exam')
    end
  end

  describe '#transliterize' do
    it 'to be "zaoe"' do
      s1 = 'źåöé'
      s2 = 'zaoe'

      expect(s1.transliterize).to eq(s2)
      expect(s1.transliterize!).to eq(s2)
    end
  end

  describe '#truncate' do
    let(:s1) { 'example string' }

    it 'to be "..."' do
      expect(s1.truncate(3)).to eq('...')
    end

    it 'to be "exa..."' do
      expect(s1.truncate(6)).to eq('exa...')
    end

    it 'to be "example..."' do
      expect(s1.truncate(12, separator: ' ')).to eq('example...')
    end

    it 'to be "exa... (more)"' do
      expect(s1.truncate(13, omission: '... (more)')).to eq('exa... (more)')
    end

    it 'to be "example string"' do
      expect(s1.truncate(15)).to eq(s1)
    end
  end

  describe '#truncate_words' do
    it 'to be "example..."' do
      expect('example string test'.truncate_words(1)).to eq('example...')
    end

    it 'to be "Once<br>upon<br>a<br>time<br>in..."' do
      s1 = 'Once<br>upon<br>a<br>time<br>in<br>a<br>world'
      s2 = 'Once<br>upon<br>a<br>time<br>in...'

      expect(s1.truncate_words(5, separator: '<br>')).to eq(s2)
    end

    it 'to be "And they found that many... (continued)"' do
      s1 = 'And they found that many people were sleeping better.'
      s2 = 'And they found that many... (continued)'

      expect(s1.truncate_words(5, omission: '... (continued)')).to eq(s2)
    end
  end

  describe '#to_time' do
    it 'to be "1969-12-31"' do
      expect('1969-12-31'.to_time).to be_a(Time)
    end

    it 'to be "1969-12-31 19:00:03"' do
      expect('1969-12-31 19:00:03'.to_time).to be_a(Time)
    end
  end

  describe '#underscore(!)' do
    it 'to be "example_string"' do
      s1 = 'ExampleString'
      s2 = 'exampleString'
      s3 = 'example_string'
      s4 = 'EXAMPLE_String'
      s5 = 'example_string'

      expect(s1.underscore).to eq(s5)
      expect(s1.underscore!).to eq(s5)
      expect(s2.underscore).to eq(s5)
      expect(s2.underscore!).to eq(s5)
      expect(s3.underscore).to eq(s5)
      expect(s3.underscore!).to eq(s5)
      expect(s4.underscore).to eq(s5)
      expect(s4.underscore!).to eq(s5)
    end

    it 'to be "example_string/test"' do
      s1 = 'ExampleString::Test'
      s2 = 'example_string/test'

      expect(s1.underscore).to eq(s2)
      expect(s1.underscore!).to eq(s2)
    end
  end

  describe '#unpollute(!)' do
    let(:s1) { 'test' }

    it 'to be "test"' do
      expect(s1.unpollute).to eq(s1)
      expect(s1.unpollute!).to eq(s1)
    end

    it 'to be "test" when polluted' do
      s2 = 't-e-s-t-'
      s3 = '-'

      expect(s2.unpollute(s3)).to eq(s1)
      expect(s2.unpollute!(s3)).to eq(s1)
    end
  end

  describe '#unshift(!)' do
    let(:s1) { 'this thing that thing' }

    it 'to be "thing this thing that thing"' do
      s2 = 'thing this thing that thing'
      s3 = 'thing '

      expect(s1.unshift(s3)).to eq(s2)
      expect(s1.unshift!(s3)).to eq(s2)
    end

    it 'to be "this that this thing that thing"' do
      s2 = 'this that this thing that thing'
      a1 = ['this ', 'that ']

      expect(s1.unshift(*a1)).to eq(s2)
      expect(s1.unshift!(*a1)).to eq(s2)
    end
  end

  describe '#unquote(!)' do
    it 'to be "example"' do
      s1 = '"example"'
      s2 = 'example'

      expect(s1.unquote).to eq(s2)
      expect(s1.unquote!).to eq(s2)
    end
  end

  describe '#upcase?' do
    it 'to be true' do
      expect('UPCASE'.upcase?).to eq(true)
      expect('UPCASE STRING'.upcase?).to eq(true)
    end

    it 'to be false' do
      expect('downcase'.upcase?).to eq(false)
      expect('Mixedcase'.upcase?).to eq(false)
    end
  end

  describe '#words' do
    it 'to be [ ... ]' do
      s1 = 'abc. 123'
      a1 = %w[abc. 123]

      expect(s1.words).to eq(a1)
    end
  end

  describe '#words_without_punctuation' do
    it 'to be [ ... ]' do
      s1 = 'Slowly, grudgingly he said: "This has to stop."'
      a1 = %w[Slowly grudgingly he said This has to stop]

      expect(s1.words_without_punctuation).to eq(a1)
    end
  end

  describe '#variablize(!)' do
    it 'to be "@example"' do
      s1 = 'example String'
      s2 = '@example_String'

      expect(s1.variablize).to eq(s2)
      expect(s1.variablize!).to eq(s2)
    end
  end

end
