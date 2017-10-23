json.array!(@products) do |product|
  json.extract! product, :id, :name, :category_id, :description, :price, :active
  json.url product_url(product, format: :json)
end
