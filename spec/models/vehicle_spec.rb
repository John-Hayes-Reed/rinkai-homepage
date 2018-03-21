require 'rails_helper'

RSpec.describe Vehicle, type: :model do
  context 'with all attributes' do
    subject { build :vehicle }
    it { is_expected.to be_valid }
  end

  context 'with nil name' do
    subject { build :vehicle, :nil_name }
    it { is_expected.not_to be_valid }
  end

  context 'with nil amount' do
    subject { build :vehicle, :nil_amount }
    it { is_expected.not_to be_valid }
  end

  context 'with amount less than 1' do
    subject { build :vehicle, :low_amount }
    it { is_expected.not_to be_valid }
  end
end
