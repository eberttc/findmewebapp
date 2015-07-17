json.array!(@pets) do |pet|
  json.extract! pet, :id, :name, :photo, :sex, :age, :vaccinated, :information, :state, :pet_type_id, :user_id, :race_id
  json.url user_pet_url(current_user,pet, format: :json)
end
