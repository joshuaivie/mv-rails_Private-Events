class EventCreator < ApplicationRecord
  belongs_to :event_creator, class_name: 'User', foreign_key: 'event_creator_id'
  belongs_to :creator_event, class_name: 'Event', foreign_key: 'creator_event_id'
end
