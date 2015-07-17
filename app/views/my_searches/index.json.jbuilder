json.array!(@my_searches) do |my_search|
  json.extract! my_search, :id, :lost_pet_id, :user_id
  json.url my_search_url(my_search, format: :json)
end
