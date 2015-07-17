json.array!(@profiles) do |profile|
  json.extract! profile, :id, :name, :lastname, :address, :sex, :user_id, :district_id
  json.url profile_url(profile, format: :json)
end
