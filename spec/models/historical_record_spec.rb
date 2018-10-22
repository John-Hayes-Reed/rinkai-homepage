require 'rails_helper'

RSpec.describe HistoricalRecord, type: :model do
  subject { described_class.new }
  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:body) }
end
