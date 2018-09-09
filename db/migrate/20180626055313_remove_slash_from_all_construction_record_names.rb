class RemoveSlashFromAllConstructionRecordNames < ActiveRecord::Migration[5.1]
  def change
    ConstructionRecord.transaction do
      ConstructionRecord.all.each do |cr|
          cr.customer.gsub!('／', '')
          cr.customer.gsub!('　', '')
          cr.save!
      end
    end
  end
end
