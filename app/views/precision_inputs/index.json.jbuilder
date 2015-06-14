json.array!(@precision_inputs) do |precision_input|
  json.extract! precision_input, :id, :session_id, :event_id, :field_name, :is_correct, :how_wrong
  json.url precision_input_url(precision_input, format: :json)
end
