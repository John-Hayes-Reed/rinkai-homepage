require "rails_helper"

RSpec.describe HistoricalRecordsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/historical_records").to route_to("historical_records#index")
    end
  end
end
