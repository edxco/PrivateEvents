require 'rails_helper'

RSpec.describe 'Sign in', type: :request do
  describe 'GET /new' do
    it 'redirects to sign in if not signed' do
      get '/events/new'
      expect(response).to redirect_to(login_path)
    end
  end

  before :each do
    User.new(username: 'user')
  end

  it 'register user' do
    visit '/users/new'
    within('.register-form') do
      fill_in 'username', with: 'user'
    end
    click_button 'Sign Up'
    expect(current_path).to eq(user_path(1))
  end
end
