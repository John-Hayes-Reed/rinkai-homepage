# frozen_string_literal: true

module Admin
  # Controller for Administrative pages dealing with Historical Records.
  class HistoricalRecordsController < ApplicationController
    before_action :authenticate_administrator!
    before_action :set_historical_record, only: %i[show edit update destroy]

    # GET /historical_records
    # GET /historical_records.json
    def index
      @historical_records = HistoricalRecord.all
    end

    # GET /historical_records/1
    # GET /historical_records/1.json
    def show; end

    # GET /historical_records/new
    def new
      @historical_record = HistoricalRecord.new
    end

    # GET /historical_records/1/edit
    def edit; end

    # POST /historical_records
    # POST /historical_records.json
    def create
      @historical_record = HistoricalRecord.new(historical_record_params)

      respond_to do |format|
        if @historical_record.save
          format.html { redirect_to :admin_historical_records, notice: 'Historical record was successfully created.' }
          format.json { render :index, status: :created, location: @historical_record }
        else
          format.html { render :new }
          format.json { render json: @historical_record.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /historical_records/1
    # PATCH/PUT /historical_records/1.json
    def update
      respond_to do |format|
        if @historical_record.update(historical_record_params)
          format.html { redirect_to :admin_historical_records, notice: 'Historical record was successfully updated.' }
          format.json { render :show, status: :ok, location: @historical_record }
        else
          format.html { render :edit }
          format.json { render json: @historical_record.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /historical_records/1
    # DELETE /historical_records/1.json
    def destroy
      @historical_record.destroy
      respond_to do |format|
        format.html { redirect_to :admin_historical_records, notice: 'Historical record was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_historical_record
      @historical_record = HistoricalRecord.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def historical_record_params
      params.require(:historical_record).permit(:title, :body)
    end
  end
end
