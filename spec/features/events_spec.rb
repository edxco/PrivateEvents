require 'rails_helper'
RSpec.describe 'Event', type: :feature do
  it 'It should create a new Event' do
    User.create(username: 'User 1')
    visit new_session_path
    fill_in 'username', with: 'User 1'
    find("input[type='submit']").click
    visit new_event_path
    fill_in 'title', with: 'Test event A'
    fill_in 'date', with: Date.current
    fill_in 'location', with: 'Location 1'
    fill_in 'event_date', with: Date.current

    find("input[type='submit']").click
    expect(page).to have_content(/Event created!/i)
  end
end
