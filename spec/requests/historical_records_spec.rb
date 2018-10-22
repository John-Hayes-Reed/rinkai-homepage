require 'rails_helper'

RSpec.describe "HistoricalRecords", type: :request do
  before { create_global_information! }

  describe "GET /historical_records" do
    it "displays a list of historical records" do
      # Arrange
      first_record = HistoricalRecord.create! title: 'TEST_TITLE', body: 'TEST_BODY'
      second_record = HistoricalRecord.create! title: 'TEST_TITLE', body: 'TEST_BODY'

      # Act
      get historical_records_path

      # Assert
      expect(response).to have_http_status(200)
      expect(assigns(:historical_records)).to include first_record, second_record
    end
  end
end
