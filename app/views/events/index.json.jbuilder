json.array!(@events) do |event|
  json.extract! event, :id, :name, :location, :description, :datetime, :price, :imagepath, :pdate, :ptime, :dump
  json.url event_url(event, format: :json)
end
