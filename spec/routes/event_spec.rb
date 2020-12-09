require 'rails_helper'

RSpec.describe EventsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/events').to route_to('events#index')
    end

    it 'routes to #show' do
      expect(get: '/events/1').to route_to('events#show', id: '1')
    end

    it 'routes to #new' do
      expect(get: '/events/new').to route_to('events#new')
    end
  end
end
