class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
  end

  def show
    @post = Post.find(params[:id])
  end

  def new; end

  def create
    @post = Post.new post_params
    @author = current_user
    @post.user = @author

    if @post.valid?
      @post.save

      redirect_to user_posts_path(@author)
    else
      redirect_to new_post_path
    end
  end

  private

  def fetch_author
    return nil unless params[:user_id]

    @author = User.find(params[:user_id])
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
