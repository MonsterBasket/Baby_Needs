class Like < ApplicationRecord
  belongs_to :user
  belongs_to :liked, polymorphic: true

  validates_presence_of :category

  before_save :add_rating
  before_destroy :remove_rating
  validate :same_user
  validates :user_id, uniqueness: {scope: [:liked_id, :liked_type] }

  private

  def remove_rating
    change_rating category == "like" ? -1 : 1
  end

  def add_rating
    change_rating category == "like" ? 1 : -1
  end

  def change_rating(mult = 1)
    liked.rating += (1 * mult)
    liked.save
    if liked.class == Problem || liked.class == LostItem
      liked.user.reputation += (10 * mult)
    elsif liked.class == Solution || liked.class || Location
      liked.user.reputation += (5 * mult)
    else
      liked.user.comment += (1 * mult)
    end
    liked.user.save
  end

  def same_user
    return if !user || !liked || !category
    errors.add(:user, "cannot like your own posts") if liked.user == self.user
  end
end
