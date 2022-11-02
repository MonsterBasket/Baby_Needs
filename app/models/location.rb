class Location < ApplicationRecord
  belongs_to :User
  belongs_to :LostItem
  has_many :comments, as: :commented_on
  has_many :likes, as: :liked
end
