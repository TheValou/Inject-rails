json.extract! user, :id, :roleId, :authId, :firstname, :lastname, :email, :password, :active, :createdat, :updatedat, :created_at, :updated_at
json.url user_url(user, format: :json)
