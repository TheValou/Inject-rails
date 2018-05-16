json.extract! users_auth, :id, :name, :description, :created_at, :updated_at
json.url users_auth_url(users_auth, format: :json)
