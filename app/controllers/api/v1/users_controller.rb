module Api
  module V1
    class Api::V1::UsersController < AuthenticationController
      # skip_before_action :authenticate_request, only: [:create]
      def index
        @users = User.all
        render json: @users
      end

      def show
        @user = User.find(params[:id])
        render json: @user
      end
    end
  end
end
