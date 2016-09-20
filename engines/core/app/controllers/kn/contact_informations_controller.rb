module Kn
  class ContactInformationsController < ApplicationController
    before_action :authenticate_kn_user!

    def index
      render json: current_user.contact_informations
    end

    def show
      render json: contact_information
    end

    def create
      if contact_information.save
        render json: contact_information
      else
        render json: contact_information.errors, status: 422
      end
    end

    def update
      if contact_information.update(contact_informations_params)
        render json: contact_information
      else
        render json: contact_information.errors, status: 422
      end
    end

    def destroy
      if contact_information.destroy
        render json: contact_information
      else
        render json: contact_information.errors, status: 422
      end
    end

  private

    def contact_information
      @contact_information ||= params[:id] ? current_user.contact_informations.find(params[:id]) : current_user.contact_informations.new(contact_informations_params)
    end

    def contact_informations_params
      params.require(:contact_information).permit(:name, :value)
    end

  end
end
