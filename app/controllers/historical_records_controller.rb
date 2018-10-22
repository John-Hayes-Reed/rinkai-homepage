# frozen_string_literal: true

# Controller for front facing actions with Historical Records.
class HistoricalRecordsController < ApplicationController
  # GET /historical_records
  # GET /historical_records.json
  def index
    @historical_records = HistoricalRecord.all
  end
end
