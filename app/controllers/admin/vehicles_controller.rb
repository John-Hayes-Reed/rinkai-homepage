# frozen_string_literal: true

module Admin
  # Controller for Administration flow of Vehicles.
  class VehiclesController < ApplicationController
    before_action :authenticate_administrator!
    before_action :set_vehicle, only: %i[show edit update destroy]

    # GET /vehicles
    # GET /vehicles.json
    def index
      @vehicles = Vehicle.all
    end

    # GET /vehicles/1
    # GET /vehicles/1.json
    def show; end

    # GET /vehicles/new
    def new
      @vehicle = Vehicle.new
    end

    # GET /vehicles/1/edit
    def edit; end

    # POST /vehicles
    # POST /vehicles.json
    def create
      @vehicle = Vehicle.new(vehicle_params)
      if @vehicle.save
        redirect_to [:admin, @vehicle],
                    notice: 'Vehicle was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /vehicles/1
    # PATCH/PUT /vehicles/1.json
    def update
      if @vehicle.update(vehicle_params)
        redirect_to [:admin, @vehicle],
                    notice: 'Vehicle was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /vehicles/1
    # DELETE /vehicles/1.json
    def destroy
      @vehicle.destroy
      redirect_to admin_vehicles_url,
                  notice: 'Vehicle was successfully destroyed.'
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_vehicle
      @vehicle = Vehicle.find(params[:id])
    end

    def vehicle_params
      params.require(:vehicle).permit(:name, :amount)
    end
  end
end
