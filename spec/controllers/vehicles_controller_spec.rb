require 'rails_helper'

RSpec.describe VehiclesController, type: :controller do
  before do
    create_global_information!
  end
  let(:valid_attributes) do
    build(:vehicle).attributes
  end

  describe "GET #index" do
    it "returns http success" do
      vehicle = Vehicle.create! valid_attributes
      get :index
      expect(response).to be_successful
    end
  end

end
