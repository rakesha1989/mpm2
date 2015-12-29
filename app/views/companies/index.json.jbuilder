json.array!(@companies) do |company|
  json.extract! company, :id, :suffix, :name, :sector, :cin_no, :pan_no
  json.url company_url(company, format: :json)
end
