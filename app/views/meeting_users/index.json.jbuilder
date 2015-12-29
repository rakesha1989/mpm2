json.array!(@meeting_users) do |meeting_user|
  json.extract! meeting_user, :id, :meeting_id, :user_id
  json.url meeting_user_url(meeting_user, format: :json)
end
