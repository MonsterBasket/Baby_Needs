class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :commented_on, polymorphic: true
  has_many :likes, as: :liked

  validates_presence_of :content

  attribute :rating, :integer, default: 0

end
