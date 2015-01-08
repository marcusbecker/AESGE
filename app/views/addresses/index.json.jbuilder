json.array!(@addresses) do |address|
  json.extract! address, :id, :zip_code, :type_address, :address, :number, :complement, :neighborhood, :city, :state, :note
  json.url address_url(address, format: :json)
end
