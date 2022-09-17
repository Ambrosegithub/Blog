class User < ApplicationRecord
  has_many :comments, foreign_key: 'user_id'
  has_many :posts, foreign_key: 'user_id'
  has_many :likes, foreign_key: 'user_id'
  scope :most_recent_post, -> { posts.last(3) }
end
