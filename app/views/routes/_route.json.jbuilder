json.extract! route, :id, :path, :created_at, :updated_at
json.url route_url(route, format: :json)
