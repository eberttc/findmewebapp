json.array!(@orders) do |order|
  json.extract! order, :id, :user_id, :store_id, :date, :payment_method, :status, :total
  json.url order_url(order, format: :json)
end
