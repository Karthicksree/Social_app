json.array!(@profiles) do |profile|
  json.extract! profile, :id, :full_name, :cell_phone, :birth_day, :gender, :location, :user_id
  json.url profile_url(profile, format: :json)
end
