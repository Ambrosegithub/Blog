class Post < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  validates :postCounter, presence: true, numericality: { only_integer: true >= 0 }

  has_many :likes
  has_many :comments
  belongs_to :user, foreign_key: 'user_id'
  scope :update_post_count, ->(count) { user.update_attribute 'posts_counter', count }
  scope :recent_comments, -> { comments.last(5) }
end
