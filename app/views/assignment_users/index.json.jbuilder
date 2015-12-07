json.array!(@assignment_users) do |assignment_user|
  json.extract! assignment_user, :id, :assignment_id, :user_id
  json.url assignment_user_url(assignment_user, format: :json)
end
