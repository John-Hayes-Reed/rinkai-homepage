class ChangeEnumColumnToInteger < ActiveRecord::Migration[5.1]
  def change
    change_table :construction_records do |t|
      t.remove :category
      t.integer :category
    end
  end
end
