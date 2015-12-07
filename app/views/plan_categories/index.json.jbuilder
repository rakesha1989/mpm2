json.array!(@plan_categories) do |plan_category|
  json.extract! plan_category, :id, :plan_id, :category_id
  json.url plan_category_url(plan_category, format: :json)
end
