class Comment < ApplicationRecord
  belongs_to :post 
  belongs_to :user, foreign_key: 'user_id'
  after_save :update_comments_counter

  def update_comments_counter
    post.update(comments_counter: post.comments.length)
  end
end
