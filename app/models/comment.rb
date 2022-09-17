class Comment < ApplicationRecord
   belongs_to :post
   belongs_to :user

   def post_comments_counter=(count)
      post.update_attribute 'comments_counter', count
    end
end
