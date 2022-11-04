class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :commented_on, polymorphic: true
  has_many :likes, as: :liked
end
