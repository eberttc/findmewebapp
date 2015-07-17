json.array!(@comments) do |comment|
  json.extract! comment, :id, :comment, :founded, :lost_pet_id, :user_id
  json.url comment_url(comment, format: :json)
end
