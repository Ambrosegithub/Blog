class ApplicationController < ActionController::Base
  def recent_comments
    User.all
  end
end
