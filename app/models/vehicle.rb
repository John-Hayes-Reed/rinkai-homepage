class Vehicle < ApplicationRecord
  with_options presence: true do |v|
    v.validates :name
    v.validates :amount, numericality: { only_integer: true, greater_than: 0 }
  end
end
