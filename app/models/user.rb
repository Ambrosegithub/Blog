class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  validates :post_counter, presence: true, numericality: { only_integer: true }

  validates :post_counter, presence: true, numericality: { only_integer: true }
  validates :likes_counter, presence: true, numericality: { only_integer: true }

  has_many :comments, foreign_key: 'user_id'
  has_many :posts, foreign_key: 'user_id'
  has_many :likes, foreign_key: 'user_id'
  scope :most_recent_post, -> { posts.last(3) }
end
