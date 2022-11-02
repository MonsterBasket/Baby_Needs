class Like < ApplicationRecord
  belongs_to :User
  belongs_to :liked, polymorphic: true
end
