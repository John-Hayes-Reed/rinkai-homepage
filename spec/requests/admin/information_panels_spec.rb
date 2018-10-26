require 'rails_helper'

RSpec.describe "Admin::InformationPanels", type: :request do
  let!(:administrator) { create_administrator! }
  before do
    create_global_information!
    sign_in administrator
  end
  let!(:valid_params) { { title: 'TEST TITLE', body: 'TEST BODY' } }
  let!(:invalid_params) { { title: nil, body: 'TEST BODY' } }

  describe "GET /information_panels" do
    it "displays an index list" do
      # Arrange
      2.times { InformationPanel.create! valid_params }

      # Act
      get admin_information_panels_path

      # Assert
      aggregate_failures do
        expect(response).to have_http_status(:ok)
        expect(response).to render_template :index
        expect(assigns(:information_panels).count).to eq 2
      end
    end
  end

  describe "GET /information_panels/new" do
    it 'displays a form to create a new record' do
      # Arrange
      # Act
      get new_admin_information_panel_path

      aggregate_failures do
        expect(response).to have_http_status :ok
        expect(response).to render_template :new
        expect(assigns(:information_panel)).to be_new_record
      end
    end
  end

  describe 'GET /information_panels/1/edit' do
    it 'displays a form to edit an existing record' do
      # Arrange
      information_panel = InformationPanel.create! valid_params

      # Act
      get edit_admin_information_panel_path(information_panel)

      # Assert
      aggregate_failures do
        expect(response).to have_http_status :ok
        expect(response).to render_template :edit
        expect(assigns(:information_panel)).to eq information_panel
      end
    end
  end

  describe 'POST /information_panels' do
    it 'creates a new record with valid parameters' do
      # Arrange
      # Act & Assert
      aggregate_failures do
        expect { post admin_information_panels_path, params: { information_panel: valid_params } }
          .to change(InformationPanel, :count).by(1)
        expect(response).to have_http_status :found
        expect(response).to redirect_to :admin_information_panels
      end
    end

    it 'does not create a new record with invalid parameters' do
      # Arrange
      # Act & Assert
      aggregate_failures do
        expect { post admin_information_panels_path, params: { information_panel: invalid_params } }
          .to change(InformationPanel, :count).by(0)
        expect(response).to have_http_status :ok
        expect(response).to render_template :new
      end
    end
  end

  describe 'PUT /information_panels/1' do
    it 'updates a record with valid parameters' do
      # Arrange
      information_panel = InformationPanel.create! valid_params
      update_params = { title: 'UPDATED TITLE', body: 'UPDATED BODY' }

      # Act
      put admin_information_panel_path(information_panel), params: { information_panel: update_params }
      information_panel.reload

      # Assert
      aggregate_failures do
        expect(information_panel.title).to eq update_params[:title]
        expect(information_panel.body).to eq update_params[:body]
        expect(response).to have_http_status :found
        expect(response).to redirect_to :admin_information_panels
      end
    end

    it 'does not update a record with invalid parameters' do
      # Arrange
      information_panel = InformationPanel.create! valid_params

      # Act
      put admin_information_panel_path(information_panel), params: {information_panel: invalid_params }
      information_panel.reload

      # Assert
      aggregate_failures do
        expect(response).to have_http_status :ok
        expect(response).to render_template :edit
        expect(assigns(:information_panel).errors).not_to be_empty
      end
    end
  end

  describe 'DELETE /information_panels/1' do
    it 'destroys a record' do
      # Arrange
      information_panel = InformationPanel.create! valid_params

      # Act & Assert
      aggregate_failures do
        expect { delete admin_information_panel_path(information_panel) }
          .to change(InformationPanel, :count).by(-1)
        expect(response).to have_http_status :found
        expect(response).to redirect_to :admin_information_panels
      end
    end
  end
end
