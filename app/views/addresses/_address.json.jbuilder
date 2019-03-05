json.extract! address, :id, :cep, :state, :city, :district, :street, :number, :created_at, :updated_at
json.url address_url(address, format: :json)
