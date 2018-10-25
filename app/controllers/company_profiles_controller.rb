# frozen_string_literal: true

# Controller for visitor facing actions based around the company profile.
class CompanyProfilesController < ApplicationController
  def show
    @company_profile = @global_app_information.company_profile || @global_app_information.build_company_profile
  end
end
