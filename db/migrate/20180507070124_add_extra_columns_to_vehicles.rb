class AddExtraColumnsToVehicles < ActiveRecord::Migration[5.1]
  def change
    change_table :vehicles do |t|
      t.string :serial
      t.string :make
    end
  end
end
