class Post < ApplicationRecord
  validates :title, presence: true, length: { maximum: 250 }

  has_many :likes,dependent: :destroy
  has_many :comments,counter_cache: :comments_counter,dependent: :destroy
  belongs_to :user, foreign_key: 'user_id'
  after_save :update_post_count
  def update_post_count
    user.update_attribute 'post_counter', user.posts.length
  end

  def recent_comments
    comments.last(5)
  end
end
