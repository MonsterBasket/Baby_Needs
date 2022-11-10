class Problem < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :commented_on
  has_many :likes, as: :liked

  validates_presence_of :title, :description

  attribute :rating, :integer, default: 0

  # def initialize
  #   self.rating = 0
  # end
end
