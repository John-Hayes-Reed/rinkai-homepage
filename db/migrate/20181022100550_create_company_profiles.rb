class CreateCompanyProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :company_profiles do |t|
      t.belongs_to :global_app_information
      t.text :body

      t.timestamps
    end
  end
end
