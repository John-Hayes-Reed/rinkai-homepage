require 'rails_helper'

RSpec.describe CompanyProfile, type: :model do
  it 'belongs to a company profile' do
    expect(described_class.new).to belong_to :global_app_information
  end
end
