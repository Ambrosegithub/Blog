module Api
    module V1
      class  Api::V1::PostsController < AuthenticationController
        before_action :fetch_user, only: [:index,:show]
        before_action  :authenticate_request
        def index
          @posts = @user ? @user.posts.includes(:comments,:user) : Post.includes(:comments,:user) #n+1 fix
          render json: @posts
        end

        private
        def fetch_user
            @user = User.find(params[:user_id])
            end
      end
    end
  end