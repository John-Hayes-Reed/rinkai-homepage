# frozen_string_literal: true

module Admin
  module Vehicles
    # Controller for handling Vehicle related global information
    class GlobalAppInformationsController < ApplicationController
      def update
        @global_app_information.update! global_app_information_params
        redirect_to admin_vehicles_path
      end

      def destroy
        @image = ActiveStorage::Attachment.find(params[:id])
        @image.purge
        redirect_to admin_vehicles_path
      end

      private

      def global_app_information_params
        params.require(:global_app_information).permit(vehicle_images: [])
      end
    end
  end
end
