class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.include(:comments,:post).all
  end

  def show
    @user = current_user
  end
end
