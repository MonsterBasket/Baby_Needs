class User < ApplicationRecord
  has_many :Problems, :Solutions, :LostItems, :Locations, :Comments
end
