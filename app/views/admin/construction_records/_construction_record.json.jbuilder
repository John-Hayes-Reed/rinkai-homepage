json.extract! construction_record, :id, :title, :customer, :description, :category, :started_on, :finished_on, :created_at, :updated_at
json.url construction_record_url(construction_record, format: :json)
