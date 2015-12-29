json.array!(@plan_assignments) do |plan_assignment|
  json.extract! plan_assignment, :id, :plan_id, :assignment_id
  json.url plan_assignment_url(plan_assignment, format: :json)
end
