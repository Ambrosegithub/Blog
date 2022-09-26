class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  validates :postCounter, presence: true, numericality: { only_integer: true }

  has_many :comments
  has_many :posts, foreign_key: 'user_id'
  has_many :likes, foreign_key: 'user_id'
  def recent_comments
    comments.last(3)
  end
end
