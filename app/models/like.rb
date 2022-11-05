class Like < ApplicationRecord
  belongs_to :user
  belongs_to :liked, polymorphic: true

  validates_presence_of :category

  before_save :increase_rating
  validate :same_user

  private
  def increase_rating
    liked.rating += 1
    if liked.class == Problem || liked.class == LostItem
      liked.user.reputation += 10
    elsif liked.class == Solution || liked.class || Location
      liked.user.reputation += 5
    else
      liked.user.comment += 1
    end
  end

  def same_user
    return if !user || !liked || !category
    errors.add(:user, "cannot like your own posts") if liked.user == self.user
  end
end
