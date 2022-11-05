class Like < ApplicationRecord
  belongs_to :user
  belongs_to :liked, polymorphic: true

  validates_presence_of :category
end
