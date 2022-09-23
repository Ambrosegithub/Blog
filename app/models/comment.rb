class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user, foreign_key: 'user_id'
  def intialize
    update_comments_counter = post.comments.size
  end

  def update_comments_counter=(count)
    post.update_attribute 'comments_counter', count
  end
end
