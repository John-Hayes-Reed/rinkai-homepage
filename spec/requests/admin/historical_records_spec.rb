require 'rails_helper'

RSpec.describe Admin::HistoricalRecordsController, type: :request do
  let!(:administrator) do
    Administrator.create! email: 'test@test.com', password: 'testtest'
  end

  before do
    create_global_information!
    sign_in administrator
  end

  let!(:valid_params) { { title: 'TEST_TITLE', body: 'TEST_BODY' } }
  let!(:invalid_params) { { title: 'TEST_TITLE', body: nil } }

  describe 'GET /admin/historical_records' do
    it 'displays a list of historical records' do
      # Arrange
      first_record = HistoricalRecord.create!(valid_params)
      second_record = HistoricalRecord.create!(valid_params)

      # Act
      get '/admin/historical_records'

      # Assert
      expect(response).to have_http_status(:ok)
      expect(assigns(:historical_records)).to include first_record, second_record
    end
  end

  describe 'GET /admin/historical_records/new' do
    it 'displays a form to create a new record' do
      # Arrange
      # Act
      get '/admin/historical_records/new'

      # Assert
      aggregate_failures do
        expect(response).to have_http_status(:ok)
        expect(assigns(:historical_record)).to be_new_record
        expect(response).to render_template :new
      end
    end
  end

  describe 'GET /admin/historical_records/edit' do
    it 'displays a form to edit an existing record' do
      # Arrange
      historical_record = HistoricalRecord.create!(valid_params)

      # Act
      get "/admin/historical_records/#{historical_record.id}/edit"

      # Assert
      aggregate_failures do
        expect(response).to have_http_status :ok
        expect(assigns(:historical_record)).to eq historical_record
        expect(assigns(:historical_record)).to be_persisted
        expect(response).to render_template :edit
      end
    end
  end

  describe 'POST /admin/historical_records' do
    it 'creates a new historical record for valid inputs' do
      # Arrange
      # Act
      post "/admin/historical_records", params: { historical_record: valid_params }

      # Assert
      aggregate_failures do
        expect(response).to have_http_status :found
        expect(response).to redirect_to :admin_historical_records
      end
    end

    it 'does not create a historical record for invalid inputs' do
      # Arrange
      # Act
      post '/admin/historical_records', params: { historical_record: invalid_params }

      # Assert
      aggregate_failures do
        expect(response).to have_http_status :ok
        expect(response).to render_template :new
        expect(assigns(:historical_record).errors).not_to be_empty
      end
    end
  end

  describe 'PUT /admin/historical_records/1' do
    it 'updates an existing historical record for valid inputs' do
      # Arrange
      record = HistoricalRecord.create! valid_params
      update_params = { title: 'UPDATE_TITLE', body: 'UPDATE_BODY' }

      # Act
      put "/admin/historical_records/#{record.id}", params: { historical_record: update_params }

      # Assert
      aggregate_failures do
        expect(response).to have_http_status :found
        expect(response).to redirect_to :admin_historical_records
        expect(HistoricalRecord.find(record.id).title).to eq 'UPDATE_TITLE'
        expect(HistoricalRecord.find(record.id).body).to eq 'UPDATE_BODY'
      end
    end

    it 'does not update an existing hitsorical record for invalid inputs' do
      # Arrange
      record = HistoricalRecord.create! valid_params
      update_params = { title: 'UPDATE_TITLE', body: nil }

      # Act
      put "/admin/historical_records/#{record.id}", params: { historical_record: update_params }

      # Assert
      aggregate_failures do
        expect(response).to have_http_status :ok
        expect(response).to render_template :edit
        expect(assigns(:historical_record).errors).not_to be_empty
      end
    end
  end

  describe 'DELETE /admin/historical_records' do
    it 'deletes an existing historical record' do
      # Arrange
      record = HistoricalRecord.create! valid_params

      # Act and Assert
      aggregate_failures do
        expect { delete "/admin/historical_records/#{record.id}" }.to change(HistoricalRecord, :count).by(-1)
        expect(response).to have_http_status :found
        expect(response).to redirect_to :admin_historical_records
      end
    end
  end
end
