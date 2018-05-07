require 'rails_helper'

RSpec.describe JapaneseDate do
  describe '::from_western' do
    subject { described_class.from_western(Date.new(1989, 11)) }
    it { expect(subject.calendar_format).to eq :western }
    it { expect(subject.date).to eq 'H1.11'}
    it { expect(subject.western_date.year).to eq 1989 }
    it { expect(subject.western_date.month).to eq 11 }
  end

  describe '::from_japanese' do
    subject { described_class.from_japanese 'H1.11' }
    it { expect(subject.calendar_format).to eq :japanese }
    it { expect(subject.date).to eq 'H1.11' }
    it { expect(subject.western_date.year).to eq 1989 }
    it { expect(subject.western_date.month).to eq 11 }
  end
end
