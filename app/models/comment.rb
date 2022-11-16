class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :commented_on, polymorphic: true
  has_many :likes, as: :liked
  has_many :comments, as: :commented_on

  validates_presence_of :content

  attribute :rating, :integer, default: 0

  def liked?(user)
    !!self.likes.find{ |like| like.user_id == user.id && like.category == "like" }
  end

  def disliked?(user)
    !!self.likes.find{ |like| like.user_id == user.id && like.category == "dislike" }
  end


end
