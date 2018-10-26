# frozen_string_literal: true

module Admin
  # Control for administrative actions for information panels.
  class InformationPanelsController < ApplicationController
    before_action :authenticate_administrator!
    before_action :set_information_panel, only: %i[show edit update destroy]

    # GET /information_panels
    # GET /information_panels.json
    def index
      @information_panels = InformationPanel.order(:position).all
    end

    # GET /information_panels/1
    # GET /information_panels/1.json
    def show; end

    # GET /information_panels/new
    def new
      @information_panel = InformationPanel.new
    end

    # GET /information_panels/1/edit
    def edit; end

    # POST /information_panels
    # POST /information_panels.json
    def create
      @information_panel = InformationPanel.new(information_panel_params)

      respond_to do |format|
        if @information_panel.save
          format.html { redirect_to :admin_information_panels, notice: 'Information panel was successfully created.' }
          format.json { render :show, status: :created, location: @information_panel }
        else
          format.html { render :new }
          format.json { render json: @information_panel.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /information_panels/1
    # PATCH/PUT /information_panels/1.json
    def update
      respond_to do |format|
        if @information_panel.update(information_panel_params)
          format.html { redirect_to :admin_information_panels, notice: 'Information panel was successfully updated.' }
          format.json { render :show, status: :ok, location: @information_panel }
        else
          format.html { render :edit }
          format.json { render json: @information_panel.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /information_panels/1
    # DELETE /information_panels/1.json
    def destroy
      @information_panel.destroy
      respond_to do |format|
        format.html { redirect_to :admin_information_panels, notice: 'Information panel was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_information_panel
      @information_panel = InformationPanel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def information_panel_params
      params.require(:information_panel).permit(:title, :body, :panel_image, :position)
    end
  end
end
