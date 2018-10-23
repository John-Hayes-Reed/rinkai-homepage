class AddPositionToInformationPanel < ActiveRecord::Migration[5.2]
  def change
    add_column :information_panels, :position, :integer
  end
end
