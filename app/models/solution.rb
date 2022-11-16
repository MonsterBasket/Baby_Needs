class Solution < ApplicationRecord
  belongs_to :user
  belongs_to :problem
  has_many :comments, as: :commented_on
  has_many :likes, as: :liked

  validates_presence_of :user, :problem, :description

  attribute :rating, :integer, default: 0

  def liked?(user)
    !!self.likes.find{ |like| like.user_id == user.id && like.category == "like" }
  end

  def disliked?(user)
    !!self.likes.find{ |like| like.user_id == user.id && like.category == "dislike" }
  end


end
