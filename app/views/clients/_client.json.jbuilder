json.extract! client, :id, :name, :cpf, :email, :password_digest, :address_id, :created_at, :updated_at
json.url client_url(client, format: :json)
