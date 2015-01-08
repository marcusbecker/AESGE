json.array!(@customers) do |customer|
  json.extract! customer, :id, :name, :fname, :mname, :country, :city, :uf, :birth, :email, :annotation
  json.url customer_url(customer, format: :json)
end
