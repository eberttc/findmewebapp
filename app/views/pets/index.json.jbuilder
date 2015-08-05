json.array!(@pets) do |pet|
  json.extract! pet, :id, :name, :photo, :sex, :age, :vaccinated, :information, :state, :pet_type_id, :user_id, :race_id
  
end
