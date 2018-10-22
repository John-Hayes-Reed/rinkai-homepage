# frozen_string_literal: true

# This model represents the company's profile information, only a single
#   instance of this will exist and it is linked to the global app information
#   model record with a has_one relation.
class CompanyProfile < ApplicationRecord
  belongs_to :global_app_information
end
