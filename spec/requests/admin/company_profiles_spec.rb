require 'rails_helper'

RSpec.describe "Admin::CompanyProfiles", type: :request do
  let!(:administrator) { Administrator.create! email: 'a@b.com', password: 'password' }

  before do
    sign_in administrator
    create_global_information!
  end

  describe "GET /admin/company_profile" do
    it "displays a the company profile information record when there is one" do
      # Arrange
      company_profile = GlobalAppInformation.first!.build_company_profile
      company_profile.body = 'TEST BODY'
      company_profile.save!

      # Act
      get admin_company_profile_path

      # Assert
      aggregate_failures do
        expect(response).to have_http_status(200)
        expect(response).to render_template :show
        expect(assigns(:company_profile)).to eq company_profile
      end
    end

    it 'displays a new company profile record when one is not yet present' do
      # Arrange
      # Act
      get admin_company_profile_path

      # Assert
      aggregate_failures do
        expect(response).to have_http_status 200
        expect(response).to render_template :show
        expect(assigns(:company_profile)).to be_new_record
      end
    end
  end

  describe 'GET /admin/company_profile/new' do
    it 'gets a new record ready to be created' do
      # Assert
      # Act
      get new_admin_company_profile_path

      # Assert
      aggregate_failures do
        expect(response).to have_http_status 200
        expect(response).to render_template :new
        expect(assigns(:company_profile)).to be_new_record
      end
    end
  end

  describe 'GET /admin/company_profile/edit' do
    it 'prepares the existing company profile for editing' do
      # Arrange
      GlobalAppInformation.first!.build_company_profile(body: 'TEST BODY').save!
      company_profile = GlobalAppInformation.first!.company_profile

        # Act
      get edit_admin_company_profile_path

      # Assert
      aggregate_failures do
        expect(response).to have_http_status 200
        expect(response).to render_template :edit
        expect(assigns(:company_profile)).not_to be_new_record
        expect(assigns(:company_profile)).to eq company_profile
      end
    end
  end

  describe 'POST /admin/company_profile' do
    it 'creates a new company profile record' do
      # Arrange
      params = { company_profile: { body: 'TEST BODY' } }

      # Act & Assert
      aggregate_failures do
        expect { post admin_company_profile_path, params: params }.to change(CompanyProfile, :count).by(1)
        expect(response).to have_http_status :found
        expect(response).to redirect_to :admin_company_profile
      end
    end
  end

  describe 'PUT /admin/company_profile' do
    it 'updates an existing company profile record' do
      # Assert
      GlobalAppInformation.first!.build_company_profile(body: 'TEST BODY').save!
      company_profile = GlobalAppInformation.first!.company_profile

      params = { company_profile: { body: 'UPDATE BODY' } }

      # Act & Assert
      aggregate_failures do
        expect { put(admin_company_profile_path, params: params); company_profile.reload }.to change(company_profile, :body)
        expect(response).to have_http_status :found
        expect(response).to redirect_to :admin_company_profile
      end
    end
  end
end
