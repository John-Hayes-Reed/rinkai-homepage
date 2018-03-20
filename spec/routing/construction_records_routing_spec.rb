require 'rails_helper'

RSpec.describe ConstructionRecordsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/construction_records').to route_to('construction_records#index')
    end
  end
end
