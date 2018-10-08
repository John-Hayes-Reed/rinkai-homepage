# frozen_string_literal: true

# Class to represent information and configuration for the application as a
#   whole.
class GlobalAppInformation < ApplicationRecord
  has_many_attached :vehicle_images
end
