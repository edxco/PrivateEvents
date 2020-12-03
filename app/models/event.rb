class Event < ApplicationRecord
    validates :title, presence: true, length: { minimum: 6, maximum: 100 }
    validates :date, presence: true
    validates :location, presence: true

    belongs_to :user
end