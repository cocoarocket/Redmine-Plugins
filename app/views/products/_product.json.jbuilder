json.extract! product, :id, :name, :price, :number_count, :issue_id, :production_date, :created_at, :updated_at
json.url product_url(product, format: :json)
