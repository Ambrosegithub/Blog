class Post < ApplicationRecord
  validates :title, presence: true, length: { maximum: 250 }

  has_many :likes
  has_many :comments
  belongs_to :user, foreign_key: 'user_id'
  def update_post_count(count)
    user.update_attribute 'posts_counter', count
  end

  def recent_comments
    comments.last(5)
  end
end
