json.array!(@vehicles) do |vehicle|
  json.extract! vehicle, :id, :name
  json.url vehicle_url(vehicle, format: :json)
end
