# frozen_string_literal: true

# Controller for the public flow of control for construction records.
class ConstructionRecordsController < ApplicationController
  def index
    @construction_records = ConstructionRecord
                            .finished_in_year_group_for(params[:year])
  end
end
