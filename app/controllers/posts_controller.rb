class PostsController < ApplicationController
  load_and_authorize_resource
  def index
    @user = current_user
  end

  def show
    @post = Post.includes(:comments,:user).find(params[:id])
  end

  def new
    @post=Post.new
   end

  def create
    @post = Post.new post_params

    @post.user = current_user

    if @post.valid?
      @post.save
      redirect_to user_posts_path(current_user)
    else
      redirect_to new_post_path
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to user_post_path(current_user,@post)
    else
      render :edit, status: :unprocessable_entity
    end
  end
  def destroy
    @post= Post.find(params[:id])
    @post.destroy

    redirect_to root_path, status: :see_other
  end
  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
