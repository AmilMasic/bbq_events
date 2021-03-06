class UserEvent < ApplicationRecord
  belongs_to :user
  belongs_to :event

  accepts_nested_attributes_for :event
  accepts_nested_attributes_for :user

  validates :foodname, :foodtype, :fuel, presence: true


end
