# frozen_string_literal: true

# A Historical Record (Enkaku) for the company
class HistoricalRecord < ApplicationRecord
  with_options presence: true do |v|
    v.validates :title
    v.validates :body
  end
end
