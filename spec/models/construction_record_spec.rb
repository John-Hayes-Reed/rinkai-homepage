require 'rails_helper'

RSpec.describe ConstructionRecord, type: :model do
  context 'with all attributes' do
    subject { build :construction_record }
    it { is_expected.to be_valid }
  end

  context 'with nil title' do
    subject { build :construction_record, :nil_title }
    it { is_expected.not_to be_valid }
  end

  context 'with nil customer' do
    subject { build :construction_record, :nil_customer }
    it { is_expected.not_to be_valid }
  end

  context 'with nil description' do
    subject { build :construction_record, :nil_description }
    it { is_expected.to be_valid }
  end

  context 'with nil category' do
    subject { build :construction_record, :nil_category }
    it { is_expected.not_to be_valid }
  end

  context 'with nil started_on' do
    subject { build :construction_record, :nil_started_on }
    it { is_expected.not_to be_valid }
  end

  context 'with nil finished_on' do
    subject { build :construction_record, :nil_finished_on }
    it { is_expected.not_to be_valid }
  end
end
