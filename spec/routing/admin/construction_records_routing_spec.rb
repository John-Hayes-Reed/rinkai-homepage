require "rails_helper"

RSpec.describe Admin::ConstructionRecordsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "admin/construction_records").to route_to("admin/construction_records#index")
    end

    it "routes to #new" do
      expect(:get => "admin/construction_records/new").to route_to("admin/construction_records#new")
    end

    it "routes to #show" do
      expect(:get => "admin/construction_records/1").to route_to("admin/construction_records#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "admin/construction_records/1/edit").to route_to("admin/construction_records#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "admin/construction_records").to route_to("admin/construction_records#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "admin/construction_records/1").to route_to("admin/construction_records#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "admin/construction_records/1").to route_to("admin/construction_records#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "admin/construction_records/1").to route_to("admin/construction_records#destroy", :id => "1")
    end
  end
end
