class Problem < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :commented_on
  has_many :likes, as: :liked

  validates_presence_of :title, :description

  attribute :rating, :integer, default: 0

  #not sure if this is really required with my validation in like.rb
  def liked?(user)
    !!self.likes.find{ |like| like.user_id == user[:id] && like.category == "like" } #should be user.id, not user[:id]
  end

  def disliked?(user)
    !!self.likes.find{ |like| like.user_id == user[:id] && like.category == "dislike" } #should be user.id, not user[:id]
  end


end
