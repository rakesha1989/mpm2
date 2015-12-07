json.array!(@meetings) do |meeting|
  json.extract! meeting, :id, :plan_month, :date, :company_id, :category
  json.url meeting_url(meeting, format: :json)
end
