class Post < ApplicationRecord
  has_many :likes
  has_many :comments
  belongs_to :user
  scope :update_post_count, ->(count) { user.update_attribute 'posts_counter', count }
  scope :recent_comments, -> { comments.last(5) }
end
