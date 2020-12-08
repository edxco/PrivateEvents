require 'rails_helper'
RSpec.describe 'Creating an event', type: :feature do
  it 'valid inputs' do
    visit new_event_path
    fill_in 'Title', with: 'Event 1'
    click_on 'Create'
    visit events_path
    expect(page).to have_content('Event 1')
  end

  it 'valid inputs' do
    visit new_event_path
    fill_in 'Title', with: ''
    click_on 'Create'
    # visit events_path
    expect(page).to have_content("Name can't be blank")
  end
end
