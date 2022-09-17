class User < ApplicationRecord
  has_many :comments
  has_many :posts
  has_many :likes
  scope :most_recent_post, -> { posts.last(3) }
end
