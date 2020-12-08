require 'rails_helper'

RSpec.describe Attendee, type: :model do
  # subject { Attendee.new }

  describe 'associations' do
    it { should belong_to(:user).class_name('User') }
    it { should belong_to(:event).class_name('Event') }
  end
end
