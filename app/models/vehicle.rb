# frozen_string_literal: true

# Model for a Vehicle entry owne by Rinkai.
class Vehicle < ApplicationRecord
  with_options presence: true do |v|
    v.validates :name
    v.validates :amount, numericality: { only_integer: true, greater_than: 0 }
  end
end
