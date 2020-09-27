require 'rails_helper'

RSpec.describe 'Sessions', type: :feature do
  describe 'GET /new' do
    it 'returns http success' do
      get '/sessions/new'
      expect(response).to have_http_status(:success)
    end
  end
end
