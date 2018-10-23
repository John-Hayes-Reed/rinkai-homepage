require "rails_helper"

RSpec.describe Admin::InformationPanelsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/admin/information_panels").to route_to("admin/information_panels#index")
    end

    it "routes to #new" do
      expect(:get => "/admin/information_panels/new").to route_to("admin/information_panels#new")
    end

    it "routes to #edit" do
      expect(:get => "/admin/information_panels/1/edit").to route_to("admin/information_panels#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/admin/information_panels").to route_to("admin/information_panels#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/admin/information_panels/1").to route_to("admin/information_panels#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/admin/information_panels/1").to route_to("admin/information_panels#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/admin/information_panels/1").to route_to("admin/information_panels#destroy", :id => "1")
    end
  end
end
