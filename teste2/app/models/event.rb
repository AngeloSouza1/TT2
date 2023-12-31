class Event < ApplicationRecord
    has_many :awards
    has_many :event_participants
    has_many :users, through: :event_participants
  end