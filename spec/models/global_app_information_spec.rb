require 'rails_helper'

RSpec.describe GlobalAppInformation, type: :model do
  it 'has a company profile' do
    expect(described_class.new).to have_one :company_profile
  end
end
