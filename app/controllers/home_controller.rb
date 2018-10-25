# frozen_string_literal: true

# The main Control class for Home pages.
class HomeController < ApplicationController
  def index
    @information_panels = InformationPanel.order(:position).all
  end
end
