class User < ApplicationRecord
  has_many :problems
  has_many :solutions
  has_many :lost_items
  has_many :locations
  has_many :comments
  has_many :likes
  has_many :post_likes, through: :problems, source: :likes
  has_many :post_likes, through: :lost_items, source: :likes
  has_many :answer_likes, through: :solutions, source: :likes
  has_many :answer_likes, through: :locations, source: :likes
  has_many :comment_likes, through: :comments, source: :likes

  validates_presence_of :user_name, :display_name, :email, :password
  validates_uniqueness_of :user_name, :display_name, :email

  attribute :reputation, :integer, default: 0

  # def reputation
  #   (post_likes.count * 10) + (answer_likes.count * 5) + comment_likes.count
  # end
end
