require 'rails_helper'
RSpec.describe 'Creating an event', type: :system do
  # before do
  #   visit root_url
  #   click_button 'LOGIN'

  #   expect(current_path).to eq(new_session_path)
  #   page.fill_in placeholder: 'Create a new username', with: 'User 1'
  #   click_button 'Sign Up'
  # end

  describe 'new event page' do
    it 'Loads the right content' do
      visit new_event_path
      expect(page).to have_content('You must be logged in to perform that action')
    end
  end

  # it 'valid inputs' do
  #   visit new_event_path
  #   page.fill_in placeholder: 'Event Title', with: 'Event 1'
  #   click_button 'Create'
  #   visit events_path
  #   expect(page).to have_content('Event 1')
  # end

  # it 'invalid inputs' do
  #   visit new_event_path
  #   page.fill_in placeholder: 'Event Title', with: ''
  #   click_button 'Create'
  #   # visit events_path
  #   expect(page).to have_content("Name can't be blank")
  # end
end
