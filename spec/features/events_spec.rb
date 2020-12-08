require 'rails_helper'
RSpec.describe 'Event', type: :feature do
  it 'if title present' do
    u = Event.new
    u.title = 'user'
    u.valid?
    expect(u.errors[:title]).to_not include("can't be blank")
  end

  it 'if title not present' do
    u = Event.new
    u.title = ''
    u.valid?
    expect(u.errors[:title]).to include("can't be blank")
  end
end
