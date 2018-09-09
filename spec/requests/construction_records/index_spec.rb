require 'rails_helper'

RSpec.describe 'Construction Records index request', type: :request do
  it 'returns a successful response with a list of construction records' do
    # Arrange
    valid_attributes = build(:construction_record).attributes
    construction_record = ConstructionRecord.create! valid_attributes

    # Act
    get '/construction_records/2016'

    # Assert
    expect(response).to be_successful
    expect(assigns(:construction_records)['civil']).to include(construction_record)
  end
end
