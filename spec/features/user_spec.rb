require 'rails_helper'

RSpec.describe 'User', type: :feature do
  it 'It should create a new user' do
    u = User.new
    u.username = 'user'
    u.valid?
    expect(u.errors[:username]).to_not include("can't be blank")
  end
end
