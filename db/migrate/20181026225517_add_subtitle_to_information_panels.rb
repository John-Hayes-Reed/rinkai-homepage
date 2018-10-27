class AddSubtitleToInformationPanels < ActiveRecord::Migration[5.2]
  def change
    add_column :information_panels, :subtitle, :string
  end
end
