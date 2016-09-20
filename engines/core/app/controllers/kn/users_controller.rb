module Kn
  class UsersController < ApplicationController
    before_action :authenticate_kn_user!

    def show
      render json: current_user
    end

    def update
      if current_user.update(user_params)
        render json: current_user
      else
        render json: current_user.errors, status: 422
      end
    end

  private

    def user_params
      params.require(:user).permit(:name)
    end

  end
end
