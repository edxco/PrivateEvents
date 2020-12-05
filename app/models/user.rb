class User < ApplicationRecord
    before_save { self.username = username.downcase}
    validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 3, maximum: 25 }

    has_many :events
    has_many :attendees
    
    has_many :attended_events, through: :attendees, source: :event

    scope :upcoming, -> { where('date >= ?', Date.today) }
  	scope :past, -> { where('date < ? ', Date.today) }
end