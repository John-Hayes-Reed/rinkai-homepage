require 'rails_helper'

RSpec.describe ConstructionRecordsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/construction_records/2016').to route_to('construction_records#index', year: '2016')
    end
  end
end
