require 'rails_helper'

RSpec.describe Admin::HistoricalRecordsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/admin/historical_records').to route_to('admin/historical_records#index')
    end

    it 'routes to #new' do
      expect(get: '/admin/historical_records/new').to route_to('admin/historical_records#new')
    end

    it 'routes to #edit' do
      expect(get: '/admin/historical_records/1/edit').to route_to('admin/historical_records#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/admin/historical_records').to route_to('admin/historical_records#create')
    end

    it 'routes to #update' do
      expect(put: '/admin/historical_records/1').to route_to('admin/historical_records#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/admin/historical_records/1').to route_to('admin/historical_records#destroy', id: '1')
    end
  end
end
