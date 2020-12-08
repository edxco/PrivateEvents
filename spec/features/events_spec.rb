require 'rails_helper'
RSpec.describe 'Creating an event', type: :system do
  it 'valid inputs' do
    visit new_event_path
    page.fill_in placeholder: 'Event Title', with: 'Event 1'
    click_button 'Create'
    visit events_path
    expect(page).to have_content('Event 1')
  end

  it 'invalid inputs' do
    visit new_event_path
    page.fill_in placeholder: 'Event Title', with: ''
    click_button 'Create'
    # visit events_path
    expect(page).to have_content("Name can't be blank")
  end
end
