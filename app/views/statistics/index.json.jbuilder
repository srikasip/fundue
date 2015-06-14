json.array!(@statistics) do |statistic|
  json.extract! statistic, :id, :total_events, :num_addresses, :num_pdate, :num_ptime, :num_price
  json.url statistic_url(statistic, format: :json)
end
