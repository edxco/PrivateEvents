class Event < ApplicationRecord
    validates :title, presence: true, length: { minimum: 6, maximum: 100 }
    validates :date, presence: true
    validates :location, presence: true

    belongs_to :user
    has_many :attendees
    has_many :user_attendee, through: :attendees, source: :user

    scope :upcoming, -> { where('date >= ?', DateTime.now) }
  	scope :past, -> { where('date < ? ', DateTime.now) }
end