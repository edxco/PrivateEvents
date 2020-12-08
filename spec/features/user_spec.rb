require 'rails_helper'

RSpec.describe 'Create user', type: :system do
  it 'valid inputs' do
    visit new_user_path
    page.fill_in placeholder: 'Create a new username', with: 'User 1'
    click_button 'Sign Up'
    visit users_path
    expect(page).to have_content('User 1')
  end

  it 'valid inputs' do
    visit new_user_path
    page.fill_in placeholder: 'Create a new username', with: ''
    click_button 'Sign Up'
    # visit users_path
    expect(page).to have_content("Name can't be blank")
  end
end
