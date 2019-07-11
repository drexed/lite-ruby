# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Array do

  describe '#assert_valid_values!' do
    it 'to be []' do
      expect([].assert_valid_values!(:foo)).to eq([])
    end

    it 'to be [:foo]' do
      expect(%i[foo].assert_valid_values!(:foo)).to eq([:foo])
    end

    it 'to raise error' do
      expect { %i[foo bar].assert_valid_values!(:foo) }.to raise_error(ArgumentError)
    end
  end

  describe '#assert_all_valid_values!' do
    it 'to be raise error' do
      expect { [].assert_all_valid_values!(:foo) }.to raise_error(ArgumentError)
    end
  end

  describe '#after' do
    let(:a1) { [1, 2, 3] }

    it 'to be 3' do
      expect(a1.after(2)).to eq(3)
    end

    it 'to be 1' do
      expect(a1.after(3)).to eq(1)
    end

    it 'to be nil' do
      expect(a1.after(4)).to eq(nil)
    end
  end

  describe '#bury' do
    let(:a1) { [:a1, { b1: :c1 }] }

    it 'to be [:a1, { b1: :d1 }]' do
      expect(a1.bury(1, :b1, :d1)).to eq([:a1, { b1: :d1 }])
    end

    it 'to be [:a1, [:c2]]' do
      expect([:a1, [:b1]].bury(1, 0, :c1)).to eq([:a1, [:c1]])
    end

    it 'to raise error' do
      expect { a1.bury(:moo) }.to raise_error(ArgumentError)
    end
  end

  describe '#before' do
    let(:a1) { [1, 2, 3] }

    it 'to be 3' do
      expect(a1.before(2)).to eq(1)
    end

    it 'to be 1' do
      expect(a1.before(1)).to eq(3)
    end

    it 'to be nil' do
      expect(a1.before(4)).to eq(nil)
    end
  end

  describe '#demote(!)' do
    let(:a1) { [1, 2, 2, 3] }

    it 'to be [1, 3, 2, 2]' do
      a2 = [1, 3, 2, 2]

      expect(a1.demote(2)).to eq(a2)
      expect(a1.demote!(2)).to eq(a2)
    end

    it 'to be [2, 2, 3, 1]' do
      a2 = [2, 2, 3, 1]

      expect(a1.demote(1)).to eq(a2)
      expect(a1.demote!(1)).to eq(a2)
    end

    it 'to be [1, 2, 2, 3]' do
      expect(a1.demote(4)).to eq(a1)
      expect(a1.demote!(4)).to eq(a1)
    end
  end

  describe '#denillify(!)' do
    let(:a1) { [nil, 2, 3] }

    it 'to be [0, 2, 3]' do
      a2 = [0, 2, 3]

      expect(a1.denillify).to eq(a2)
      expect(a1.denillify!).to eq(a2)
    end

    it 'to be [9, 2, 3]' do
      a2 = [9, 2, 3]

      expect(a1.denillify(9)).to eq(a2)
      expect(a1.denillify!(9)).to eq(a2)
    end
  end

  describe '#delete_first(!)' do
    it 'to be [2, 3]' do
      a1 = [1, 2, 3]
      a2 = [2, 3]

      expect(a1.delete_first).to eq(a2)
      expect(a1.delete_first!).to eq(a2)
    end
  end

  describe '#delete_last(!)' do
    it 'to be [1, 2]' do
      a1 = [1, 2, 3]
      a2 = [1, 2]

      expect(a1.delete_last).to eq(a2)
      expect(a1.delete_last!).to eq(a2)
    end
  end

  describe '#delete_values' do
    it 'to be [3, 4]' do
      a1 = [1, 2, 3, 4]
      a1.delete_values(1, 2)

      expect(a1).to eq([3, 4])
    end
  end

  describe '#duplicates' do
    it 'to be [1, 2]' do
      expect([1, 1, 2, 2, 2, 3].duplicates).to eq([1, 2])
    end

    it 'to be 2' do
      expect([1, 1, 2, 2, 2, 3].duplicates(3)).to eq([2])
    end
  end

  describe '#from' do
    let(:a1) { [1, 2, 3] }

    it 'to be [1, 2, 3]' do
      expect(a1.from(0)).to eq(a1)
    end

    it 'to be [2, 3]' do
      expect(a1.from(1)).to eq([2, 3])
    end

    it 'to be [3]' do
      expect(a1.from(-1)).to eq([3])
    end
  end

  describe '#fulfill' do
    let(:a1) { [1, 2] }

    it 'to be [1, 2, "x", "x"]' do
      expect(a1.fulfill('x', 4)).to eq([1, 2, 'x', 'x'])
    end

    it 'to be [1, 2, "x"]' do
      expect(a1.fulfill('x', 3)).to eq([1, 2, 'x'])
    end

    it 'to be [1, 2]' do
      expect(a1.fulfill('x', 2)).to eq(a1)
      expect(a1.fulfill('x', 1)).to eq(a1)
    end
  end

  describe '#groups' do
    it 'to be [["1", "2", "3"], ["4", "5", "6"], ["7", "8", "9"], ["10"]]' do
      expect(%w[1 2 3 4 5 6 7 8 9 10].groups(3)).to eq([
                                                         %w[1 2 3],
                                                         %w[4 5 6],
                                                         %w[7 8 9],
                                                         %w[10]
                                                       ])
    end
  end

  describe '#in_groups' do
    let(:a1) { %w[1 2 3 4 5 6 7 8 9 10] }

    it 'to be [["1", "2", "3", "4"], ["5", "6", "7", nil], ["8", "9", "10", nil]]' do
      expect(a1.in_groups(3)).to eq([
                                      %w[1 2 3 4],
                                      ['5', '6', '7', nil],
                                      ['8', '9', '10', nil]
                                    ])
    end

    it 'to be [["1", "2", "3", "4"], ["5", "6", "7", "&nbsp;"], ["8", "9", "10", "&nbsp;"]]' do
      expect(a1.in_groups(3, '&nbsp;')).to eq([
                                                %w[1 2 3 4],
                                                ['5', '6', '7', '&nbsp;'],
                                                ['8', '9', '10', '&nbsp;']
                                              ])
    end

    it 'to be [["1", "2", "3", "4"], ["5", "6", "7"], ["8", "9", "10"]]' do
      expect(a1.in_groups(3, false)).to eq([
                                             %w[1 2 3 4],
                                             %w[5 6 7],
                                             %w[8 9 10]
                                           ])
    end
  end

  describe '#in_groups_of' do
    let(:a1) { %w[1 2 3 4 5 6 7 8 9 10] }

    it 'to be [["1", "2", "3"], ["4", "5", "6"], ["7", "8", "9"], ["10", nil, nil]]' do
      expect(a1.in_groups_of(3)).to eq([
                                         %w[1 2 3],
                                         %w[4 5 6],
                                         %w[7 8 9],
                                         ['10', nil, nil]
                                       ])
    end

    it 'to be [["1", "2", "3"], ["4", "5", "6"], ["7", "8", "9"], ["10", "&nbsp;", "&nbsp;"]]' do
      expect(a1.in_groups_of(3, '&nbsp;')).to eq([
                                                   %w[1 2 3],
                                                   %w[4 5 6],
                                                   %w[7 8 9],
                                                   ['10', '&nbsp;', '&nbsp;']
                                                 ])
    end

    it 'to be [["1", "2", "3"], ["4", "5", "6"], ["7", "8", "9"], ["10"]]' do
      expect(a1.in_groups_of(3, false)).to eq([
                                                %w[1 2 3],
                                                %w[4 5 6],
                                                %w[7 8 9],
                                                %w[10]
                                              ])
    end
  end

  describe '#indexes' do
    it 'to be [0, 2]' do
      expect(%i[a b a c].indexes(:a)).to eq([0, 2])
    end
  end

  describe '#merge(!)' do
    it 'to be [0, 1, 2, 3, 4, 5]' do
      a1 = [0, 1]
      a2 = [2, 3]
      a3 = [4, 5]
      a4 = [0, 1, 2, 3, 4, 5]

      expect(a1.merge(a2, a3)).to eq(a4)
      expect(a1.merge!(a2, a3)).to eq(a4)
    end
  end

  describe '#nillify(!)' do
    it 'to be [nil, 2, 3]' do
      a1 = ['', 2, 3]
      a2 = [nil, 2, 3]

      expect(a1.nillify).to eq(a2)
      expect(a1.nillify!).to eq(a2)
    end
  end

  describe '#probability' do
    it 'to be [:a, :b, :c, :c]' do
      expect(%i[a b c c].probability).to eq(a: 0.25, b: 0.25, c: 0.5)
    end
  end

  describe '#position' do
    it 'to be 1' do
      expect(%i[a b a c].position(:a)).to eq(1)
    end
  end

  describe '#positions' do
    it 'to be [1, 3]' do
      expect(%i[a b a c].positions(:a)).to eq([1, 3])
    end
  end

  describe '#promote' do
    let(:a1) { [1, 2, 2, 3] }

    it 'to be [2, 2, 1, 3]' do
      a2 = [2, 2, 1, 3]

      expect(a1.promote(2)).to eq(a2)
      expect(a1.promote!(2)).to eq(a2)
    end

    it 'to be [3, 1, 2, 2]' do
      a2 = [3, 1, 2, 2]

      expect(a1.promote(3)).to eq(a2)
      expect(a1.promote!(3)).to eq(a2)
    end

    it 'to be [1, 2, 2, 3]' do
      expect(a1.promote(4)).to eq(a1)
      expect(a1.promote!(4)).to eq(a1)
    end
  end

  describe '#reject_values' do
    it 'to be [1, 3, 5]' do
      expect([1, 2, 3, 4, 5].reject_values(2, 4)).to eq([1, 3, 5])
    end
  end

  describe '#rposition' do
    it 'to be 3' do
      expect(%i[a b a c].rposition(:a)).to eq(3)
    end
  end

  describe '#sample!' do
    it 'to be true' do
      a1 = [1, 2, 3]

      expect(a1.exclude?(a1.sample!)).to eq(true)
    end
  end

  describe '#split' do
    it 'to be [[1, 2], [4, 5]]' do
      expect([1, 2, 3, 4, 5].split(3)).to eq([[1, 2], [4, 5]])
    end

    it 'to be [[1, 2], [4, 5], [7, 8], [10]]' do
      expect((1..10).to_a.split { |i| (i % 3).zero? }).to eq([[1, 2], [4, 5], [7, 8], [10]])
    end
  end

  describe '#strip(!)' do
    it 'to be ["this", "is", "a", "test"]' do
      a1 = 'this    is   a  test'.split(' ')
      a2 = %w[this is a test]

      expect(a1.strip).to eq(a2)
      expect(a1.strip!).to eq(a2)
    end

    it 'to be ["this", "that"]' do
      a1 = ['this', '', 'that', nil, false]
      a2 = %w[this that]

      expect(a1.strip).to eq(a2)
      expect(a1.strip!).to eq(a2)
    end
  end

  describe '#swap' do
    it 'to be [3, 2, 1]' do
      a1 = [1, 2, 3]

      expect(a1.swap(0, 2)).to eq([3, 2, 1])
    end
  end

  describe '#to' do
    let(:a1) { [1, 2, 3] }

    it 'to be [1]' do
      expect(a1.to(0)).to eq([1])
    end

    it 'to be [1, 2]' do
      expect(a1.to(1)).to eq([1, 2])
    end

    it 'to be [1, 2, 3]' do
      expect(a1.to(-1)).to eq(a1)
    end
  end

  describe '#to_sentence' do
    let(:a1) { %w[one two] }
    let(:a2) { %w[one two three] }

    it 'to be ""' do
      expect([].to_sentence).to eq('')
    end

    it 'to be "one"' do
      expect(%w[one].to_sentence).to eq('one')
    end

    it 'to be "one and two"' do
      expect(a1.to_sentence).to eq('one and two')
    end

    it 'to be "one, two, and three"' do
      expect(a2.to_sentence).to eq('one, two, and three')
    end

    it 'to be "one-two"' do
      expect(a1.to_sentence(two_words_connector: '-')).to eq('one-two')
    end

    it 'to be "one or two or at least three"' do
      s1 = a2.to_sentence(
        words_connector: ' or ',
        last_word_connector: ' or at least '
      )

      expect(s1).to eq('one or two or at least three')
    end
  end

end
