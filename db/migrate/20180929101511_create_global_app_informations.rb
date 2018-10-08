class CreateGlobalAppInformations < ActiveRecord::Migration[5.2]
  def change
    create_table :global_app_informations do |t|

      t.timestamps
    end
  end
end
