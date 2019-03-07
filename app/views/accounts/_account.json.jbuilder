json.extract! account, :id, :number, :current_amount, :credit, :password_digest, :account_type_id, :agency_id, :client_id, :created_at, :updated_at
json.url account_url(account, format: :json)
