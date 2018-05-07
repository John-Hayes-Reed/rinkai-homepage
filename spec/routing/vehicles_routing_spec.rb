require 'rails_helper'

RSpec.describe VehiclesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/vehicles').to route_to('vehicles#index')
    end
  end
end
