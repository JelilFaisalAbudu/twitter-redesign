require 'rails_helper'

RSpec.describe TweetsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/tweets').to route_to('tweets#index')
    end

    it 'routes to #new' do
      expect(get: '/tweets/new').to route_to('tweets#new')
    end

    it 'routes to #show' do
      expect(get: '/tweets/1').to route_to('tweets#show', id: '1')
    end


    it 'routes to #create' do
      expect(post: '/tweets').to route_to('tweets#create')
    end

    
  end
end
