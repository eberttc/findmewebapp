#json.array!(@categories) do |category|
  #json.extract! category, :id, :name
 # json.url category_url(category, format: :json)
#end

#json.array!(@storecat) do |storecategory|
#  json.extract! storecategory, :store_id, :category_id
#end


#json.categories 
#json.array!(@storecat.categories) do |category|
#  json.extract! category, :id, :name
#  json.url category_url(category, format: :json)
#end


json.storeid @idstore
json.categories do
  json.array!  @storecat do |store|
      json.id store.category.id
      json.name store.category.name
  end
end