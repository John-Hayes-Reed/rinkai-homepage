require "rails_helper"

RSpec.describe Admin::CompanyProfilesController, type: :routing do
  describe "routing" do
    it "routes to #show" do
      expect(:get => "/admin/company_profile").to route_to("admin/company_profiles#show")
    end

    it "routes to #new" do
      expect(:get => "admin/company_profile/new").to route_to("admin/company_profiles#new")
    end

    it "routes to #edit" do
      expect(:get => "/admin/company_profile/edit").to route_to("admin/company_profiles#edit")
    end


    it "routes to #create" do
      expect(:post => "/admin/company_profile").to route_to("admin/company_profiles#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/admin/company_profile").to route_to("admin/company_profiles#update")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/admin/company_profile").to route_to("admin/company_profiles#update")
    end
  end
end
