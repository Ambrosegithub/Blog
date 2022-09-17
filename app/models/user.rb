class User < ApplicationRecord
  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, presence: true, numericality: { only_integer: true >= 0 }
  validates :likes_counter, presence: true, numericality: { only_integer: true >= 0 }

  has_many :comments, foreign_key: 'user_id'
  has_many :posts, foreign_key: 'user_id'
  has_many :likes, foreign_key: 'user_id'
  scope :most_recent_post, -> { posts.last(3) }
end
