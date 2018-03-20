# frozen_string_literal: true

# Model to represent a construction record that has in
# the past been completed by Rinkai.
class ConstructionRecord < ApplicationRecord
  with_options presence: true do |v|
    v.validates :title
    v.validates :customer
    v.validates :description
    v.validates :category
    v.validates :started_on
    v.validates :finished_on
  end
end
