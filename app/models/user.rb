class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  # Creator Assocation
  has_many :created_events, foreign_key: :creator_id, class_name: "Event", dependent: :destroy

  # Attended Events Assocation
  has_many :event_attendees, foreign_key: "attendee_id", dependent: :destroy
  has_many :attended_events, through: :event_attendees

  # Validations
  validates :username, length: { maximum: 20, minimum: 5 }, uniqueness: { case_sensitive: false }

  # Class Methods
  def attending?(event)
    event.attendees.include?(self)
  end

  def attend_event(event)
    event_attendees.create!(attended_event_id: event.id)
  end

  def unattend_event(event)
    event_attendees.find_by(attended_event_id: event.id).destroy
  end
end
