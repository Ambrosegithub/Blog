class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post, counter_cache: :likes_counter
  def intialize
    post.likes.size
  end

  def post_likes_counter=(count)
    post.update_attribute 'likes_counter', count
  end
end
