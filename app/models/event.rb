class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :invitation
  has_many :attendees, through: :invitation, source: :user

  scope :past, -> { where('start_date_time < ?', Date.today) }
  scope :upcoming, -> { where('start_date_time >= ?', Date.today) }
end
