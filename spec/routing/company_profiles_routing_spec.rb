require 'rails_helper'

RSpec.describe CompanyProfilesController, type: :routing do
  describe 'routing' do
    it 'routes to #show' do
      expect(get: '/company_profile').to route_to('company_profiles#show')
    end
  end
end
