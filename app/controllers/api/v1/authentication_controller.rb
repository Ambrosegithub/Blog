module Api
  module V1
    class AuthenticationController < ActionController::Base
      protect_from_forgery with: :null_session
     rescue_from ActionController::ParameterMissing, with: :parameter_missing

      def create
      user = User.find_by(name: params[:name])
      if user&.valid_password?(params[:password])
      token= AuthenticationTokenService.call(user.id)
      render json: {token: token}, status: :created
      else 
        render json: {error: 'unauthorized'}, status: :unauthorized
      end
    end

     private
     def parameter_missing(e)
        render json: {error: e.message}, status: :unprocessable_entity
      end
    end
  end
end