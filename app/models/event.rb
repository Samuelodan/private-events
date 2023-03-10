class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"
  has_many :attendances, foreign_key: "attended_event_id", dependent: :destroy
  has_many :attendees, through: :attendances, class_name: "User", dependent: :destroy

  scope :past, -> { where("date < ?", DateTime.now) }
  scope :upcoming, -> { where("date > ?", DateTime.now) }
end
