require 'rails_helper'

RSpec.describe 'Create user', type: :system do
  describe 'sign in page' do
    it 'Loads the right content' do
      visit new_user_path
      expect(page).to have_content('LOGIN')
    end
  end
end
