# frozen_string_literal: true

# Model to represent a construction record that has in
# the past been completed by Rinkai.
class ConstructionRecord < ApplicationRecord
  enum category: %i[civil architecture joint]

  with_options presence: true do |v|
    v.validates :title
    v.validates :customer
    v.validates :category
    v.validates :started_on
    v.validates :finished_on
  end

  def self.finished_in_year_group_for(year)
    date = Date.new(year.to_i, 7, 1)
    where(finished_on: date..date + 1.year)
      .order(finished_on: :desc)
      .group_by(&:category)
  end
end
