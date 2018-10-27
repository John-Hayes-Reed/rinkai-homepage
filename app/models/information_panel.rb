# frozen_string_literal: true

# Model to represent a grouping of information that appears as a panel on the
# home page of the user facing application.
class InformationPanel < ApplicationRecord
  has_one_attached :panel_image

  with_options presence: true do
    validates :position, uniqueness: true, numericality: { only_integer: true }
    validates :title
  end
end
