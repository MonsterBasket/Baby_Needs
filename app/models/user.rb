class User < ApplicationRecord
  has_many :problems
  has_many :solutions
  has_many :lost_items
  has_many :locations
  has_many :comments

  validates_presence_of :user_name, :display_name, :email, :password
end
