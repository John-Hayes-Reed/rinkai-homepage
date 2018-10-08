# frozen_string_literal: true

# Base controller class.
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :initialize_configuration

  private

  def initialize_configuration
    @global_app_information = GlobalAppInformation.first!
  end
end
