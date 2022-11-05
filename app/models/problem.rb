class Problem < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :commented_on
  has_many :likes, as: :liked

  validates_presence_of :user, :title, :description
end
