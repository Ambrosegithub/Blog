class Post < ApplicationRecord
  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  has_many :likes
  has_many :comments
  belongs_to :user, foreign_key: 'user_id'
  scope :update_post_count, ->(count) { user.update_attribute 'posts_counter', count }
  scope :recent_comments, -> { comments.last(5) }
end
