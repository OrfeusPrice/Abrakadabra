require 'spec_helper'
require 'wordlist/modifiers/downcase'

describe Wordlist::Modifiers::Downcase do
  let(:wordlist) { %w[Foo BAR baz] }

  subject { described_class.new(wordlist) }

  describe "#each" do
    let(:expected_words) { wordlist.map(&:downcase) }

    context "when given a block" do
      it "must downcase each word" do
        expect { |b|
          subject.each(&b)
        }.to yield_successive_args(*expected_words)
      end
    end

    context "when not given a block" do
      it "must return an Enumerator object for #each" do
        expect(subject.each).to be_kind_of(Enumerator)
        expect(subject.each.to_a).to eq(expected_words)
      end
    end
  end
end
