class Problem < ApplicationRecord
  belongs_to :User
  has_many :comments, as: :commented_on
  has_many :likes, as: :liked
end
