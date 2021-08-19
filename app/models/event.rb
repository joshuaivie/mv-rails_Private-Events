class Event < ApplicationRecord
  # Creator Assocation
  belongs_to :creator, class_name: 'User'

  # Attendee Assocation
  has_many :event_attendees, foreign_key: 'attended_event_id'
  has_many :attendees, through: :event_attendees

  # Scopes
  scope :upcoming_events, -> { where('Date >= ?', Time.now).order('Date ASC') }
  scope :past_events, -> { where('Date <  ?', Time.now).order('Date DESC') }

  # Validations
  validates :title, presence: true
  validates :description, presence: true
  validates :location, presence: true
  validates :date, presence: true
end
