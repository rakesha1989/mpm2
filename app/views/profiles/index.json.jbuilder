json.array!(@profiles) do |profile|
  json.extract! profile, :id, :first_name, :last_name, :d_o_b, :designation, :gender, :skill
  json.url profile_url(profile, format: :json)
end
