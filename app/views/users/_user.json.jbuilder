json.extract! user, :id, :name, :username, :email, :avatar
json.url user_url(user, format: :json)
