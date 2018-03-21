# frozen_string_literal: true

# Public control flow for Vehicles.
class VehiclesController < ApplicationController
  def index
    @vehicles = Vehicle.all
  end
end
