json.array!(@eventaggs) do |eventagg|
  json.extract! eventagg, :id, :name, :link, :site_type, :pagination, :domain, :eventpage
  json.url eventagg_url(eventagg, format: :json)
end
