require 'rails_helper'

RSpec.describe InformationPanel, type: :model do
  it 'validates presence of a title' do
    expect(described_class.new).to validate_presence_of :title
  end
  it 'validates uniqueness of position' do
    expect(described_class.new).to validate_uniqueness_of :position
  end
end
