json.array!(@cnhs) do |cnh|
  json.extract! cnh, :id, :category, :registration, :first, :validity, :customer_id
  json.url cnh_url(cnh, format: :json)
end
