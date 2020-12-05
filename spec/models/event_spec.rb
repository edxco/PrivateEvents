require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'title presence' do
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

  describe 'date presence' do
    it 'if date not present' do
      u = Event.new
      u.date = ''
      u.valid?
      expect(u.errors[:date]).to include("can't be blank")
    end

    it 'if date present' do
      u = Event.new
      u.date = '2020-11-22
      18:42:00'
      u.valid?
      expect(u.errors[:date]).to_not include("can't be blank")
    end

    it 'if date invalid' do
      u = Event.new
      u.date = 'notdate'
      u.valid?
      expect(u.errors[:date]).to include("can't be blank")
    end
  end
end
