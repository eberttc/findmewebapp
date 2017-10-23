json.array!(@orderdetails) do |orderdetail|
  json.extract! orderdetail, :id, :quantity, :price, :subtotal, :order_id
  json.url orderdetail_url(orderdetail, format: :json)
end
