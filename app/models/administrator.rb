# frozen_string_literal: true

# class to model an administrative user of the application.
class Administrator < ApplicationRecord
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable
end
