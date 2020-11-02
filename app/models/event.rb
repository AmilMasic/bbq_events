class Event < ApplicationRecord
  has_many :user_events
  has_many :users, through: :user_events

  accepts_nested_attributes_for :user_events

  validates :eventname, :location, presence: true, allow_blank: false


  def self.creator
    User.where(id: current_user.id)
  end
end
