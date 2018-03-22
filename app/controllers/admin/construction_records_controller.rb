# frozen_string_literal: true

module Admin
  # Controller for administration flow for Construction Records.
  class ConstructionRecordsController < ApplicationController
    before_action :authenticate_administrator!

    before_action :set_construction_record,
                  only: %i[show edit update destroy]

    # GET /construction_records
    # GET /construction_records.json
    def index
      @construction_records = ConstructionRecord.all
    end

    # GET /construction_records/1
    # GET /construction_records/1.json
    def show; end

    # GET /construction_records/new
    def new
      @construction_record = ConstructionRecord.new
    end

    # GET /construction_records/1/edit
    def edit; end

    # POST /construction_records
    # POST /construction_records.json
    def create
      @construction_record = ConstructionRecord.new(construction_record_params)

      if @construction_record.save
        redirect_to [:admin, @construction_record],
                    notice: 'Construction record was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /construction_records/1
    # PATCH/PUT /construction_records/1.json
    def update
      if @construction_record.update(construction_record_params)
        redirect_to [:admin, @construction_record],
                    notice: 'Construction record was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /construction_records/1
    # DELETE /construction_records/1.json
    def destroy
      @construction_record.destroy
      redirect_to admin_construction_records_url,
                  notice: 'Construction record was successfully destroyed.'
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_construction_record
      @construction_record = ConstructionRecord.find(params[:id])
    end

    # Parameters white list.
    def construction_record_params
      params.require(:construction_record)
            .permit(:title,
                    :customer,
                    :description,
                    :category,
                    :started_on,
                    :finished_on)
    end
  end
end
