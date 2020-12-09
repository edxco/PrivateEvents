require 'rails_helper'
RSpec.describe 'Creating an event', type: :system do
  describe 'new event page' do
    it 'Loads the right content' do
      visit new_event_path
      expect(page).to have_content('You must be logged in to perform that action')
    end
  end
end
