require 'rails_helper'

RSpec.describe ConstructionRecordsController, type: :controller do

  let(:valid_attributes) do
    build(:construction_record).attributes
  end

  describe "GET #index" do
    it "returns http success" do
      construction_record = ConstructionRecord.create! valid_attributes
      get :index, params: { year: 2016 }
      expect(response).to be_success
    end
  end

end
