require 'rails_helper'

RSpec.feature 'Users', type: :feature do
  describe 'GET /new' do
    it 'returns http success' do
      get '/users/new'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get '/users/show'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /edit' do
    it 'returns http success' do
      get '/users/edit'
      expect(response).to have_http_status(:success)
    end
  end
end