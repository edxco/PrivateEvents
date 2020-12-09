require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'username presence' do
    it 'if username not present' do
      u = User.new
      u.username = ''
      u.valid?
      expect(u.errors[:username]).to include("can't be blank")
    end

    it 'if username present' do
      u = User.new
      u.username = 'user'
      u.valid?
      expect(u.errors[:username]).to_not include("can't be blank")
    end
  end
end
