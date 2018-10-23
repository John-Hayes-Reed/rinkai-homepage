# frozen_string_literal: true

# Model to represent a grouping of information that appears as a panel on the
# home page of the user facing application.
class InformationPanel < ApplicationRecord
  acts_as_list
  has_one_attached :panel_image

  validates :position, uniqueness: true
  validates :title, presence: true
end
