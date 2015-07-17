json.array!(@pets) do |pet|
  json.extract! pet, :id, :name, :sex, :age, :vaccinated, :information, :state, :pet_type_id, :user_id, :race_id
  json.url pet_url(pet, format: :json)
end
