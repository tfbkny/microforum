json.array!(@users) do |user|
  json.extract! user, :id, :first_name, :last_name, :email, :votes, :is_admin, :is_moderator, :active, :last_login, :last_logout
  json.url user_url(user, format: :json)
end
