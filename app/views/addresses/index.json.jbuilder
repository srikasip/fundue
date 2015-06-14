json.array!(@addresses) do |address|
  json.extract! address, :id, :event_id, :full_address, :city, :region
  json.url address_url(address, format: :json)
end
