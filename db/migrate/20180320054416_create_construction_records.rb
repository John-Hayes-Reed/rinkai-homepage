class CreateConstructionRecords < ActiveRecord::Migration[5.1]
  def change
    create_table :construction_records do |t|
      t.string :title
      t.string :customer
      t.text :description
      t.string :category
      t.datetime :started_on
      t.datetime :finished_on

      t.timestamps
    end
  end
end
