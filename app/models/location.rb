class Location < ApplicationRecord
  belongs_to :user
  belongs_to :lost_item
  has_many :comments, as: :commented_on
  has_many :likes, as: :liked

  validates_presence_of :user, :lost_item, :name
end
