require 'rails_helper'

RSpec.describe 'Sign in', type: :request do
  describe 'GET /new' do
    it 'redirects to sign in if not signed' do
      get '/events/new'
      expect(response).to redirect_to(login_path)
    end
  end
end
