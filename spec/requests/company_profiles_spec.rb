require 'rails_helper'

RSpec.describe "CompanyProfiles", type: :request do
  before { create_global_information! }

  describe "GET /company_profile" do
    it 'displays the company profile record after one has been created' do
      # Arrange
      GlobalAppInformation.first.build_company_profile(body: 'TEST BODY').save!
      company_profile = GlobalAppInformation.first!.company_profile

      # Act
      get company_profile_path

      # Assert
      aggregate_failures do
        expect(response).to have_http_status :ok
        expect(response).to render_template :show
        expect(assigns(:company_profile)).to eq company_profile
      end
    end

    it 'displays an empty page when no record has yet been created' do
      # Arrange
      # Act
      get company_profile_path

      # Assert
      aggregate_failures do
        expect(response).to have_http_status :ok
        expect(response).to render_template :show
        expect(assigns(:company_profile)).to be_new_record
      end
    end
  end
end
