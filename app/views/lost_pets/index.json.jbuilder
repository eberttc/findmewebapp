json.array!(@lost_pets) do |lost_pet|
  json.extract! lost_pet, :id, :status, :info, :report_date, :lost_date, :latitude, :longitude, :found_date, :pet_id, :user_id, :district_id
  json.url lost_pet_url(lost_pet, format: :json)
end
