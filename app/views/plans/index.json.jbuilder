json.array!(@plans) do |plan|
  json.extract! plan, :id, :name, :start_date, :status_id, :meeting_id, :priority_id, :rating
  json.url plan_url(plan, format: :json)
end
