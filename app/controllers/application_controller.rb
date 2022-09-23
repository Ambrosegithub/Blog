class ApplicationController < ActionController::Base
  def recent_comments
    User.first
  end
end
