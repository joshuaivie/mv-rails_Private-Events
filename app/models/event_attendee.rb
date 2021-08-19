class EventAttendee < ApplicationRecord
  # Attendee Assocation
  belongs_to :attendee, class_name: 'User'

  # Attended Event Assocation
  belongs_to :attended_event, class_name: 'Event'

  # Validations
  validates :attendee_id, presence: true
  validates :attended_event_id, presence: true
end
