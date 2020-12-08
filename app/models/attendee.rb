class Attendee < ApplicationRecord
  belongs_to :event, class_name: 'Event'
  belongs_to :user, class_name: 'User'

  validates_uniqueness_of :user, scope: :event
end
