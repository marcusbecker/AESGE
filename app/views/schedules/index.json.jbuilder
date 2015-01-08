json.array!(@schedules) do |schedule|
  json.extract! schedule, :id, :event, :date, :time, :vehicle_id, :instructor_id, :customer_id
  json.url schedule_url(schedule, format: :json)
end
