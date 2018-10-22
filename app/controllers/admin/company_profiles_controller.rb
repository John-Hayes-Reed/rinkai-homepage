# frozen_string_literal: true

module Admin
  # Controller for all administrative actions regarding the company's profile
  # information.
  class CompanyProfilesController < ApplicationController
    before_action :set_company_profile, only: %i[show new create edit update destroy]

    # GET /company_profiles/1
    # GET /company_profiles/1.json
    def show; end

    # GET /company_profiles/new
    def new; end

    # GET /company_profiles/1/edit
    def edit; end

    # POST /company_profiles
    # POST /company_profiles.json
    def create
      @company_profile = build_company_profile_with_params
      respond_to do |format|
        if @company_profile.save
          format.html { redirect_to :admin_company_profile, notice: 'Company profile was successfully created.' }
          format.json { render :show, status: :created, location: @company_profile }
        else
          format.html { render :new }
          format.json { render json: @company_profile.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /company_profiles/1
    # PATCH/PUT /company_profiles/1.json
    def update
      respond_to do |format|
        if @company_profile.update(company_profile_params)
          format.html { redirect_to :admin_company_profile, notice: 'Company profile was successfully updated.' }
          format.json { render :show, status: :ok, location: @company_profile }
        else
          format.html { render :edit }
          format.json { render json: @company_profile.errors, status: :unprocessable_entity }
        end
      end
    end

    private

    def set_company_profile
      @company_profile = @global_app_information.company_profile || @global_app_information.build_company_profile
    end

    def build_company_profile_with_params
      @global_app_information.build_company_profile(company_profile_params)
    end

    def company_profile_params
      params.require(:company_profile).permit(:body)
    end
  end
end
