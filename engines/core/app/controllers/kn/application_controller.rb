module Kn
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :null_session

    include DeviseTokenAuth::Concerns::SetUserByToken

    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :authenticate

    helper_method :current_user

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    end

    def current_user
      current_kn_user
    end

    def authenticate
      authenticate_token || render_unauthorized
    end

    def authenticate_token
      authenticate_with_http_token do |token, options|
        token == "1234567890abcdef"
      end
    end

    def render_unauthorized
      self.headers['WWW-Authenticate'] = 'Token realm="Application"'
      render json: { error: "Invalid api token" }, status: 401
    end

  end
end
