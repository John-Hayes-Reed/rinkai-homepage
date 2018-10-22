class CreateHistoricalRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :historical_records do |t|
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
