require 'rails_helper'

RSpec.describe InformationPanel, type: :model do
  it 'validates presence of a title' do
    expect(described_class.new).to validate_presence_of :title
  end
  it 'validates presence, uniqueness, and integer of position' do
    aggregate_failures do
      expect(described_class.new).to validate_presence_of :position
      expect(described_class.new).to validate_uniqueness_of :position
      expect(described_class.new).to validate_numericality_of(:position).only_integer
    end
  end
end
