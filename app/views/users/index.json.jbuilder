json.array!(@users) do |user|
  json.extract! user, :id, :name, :contact, :emial, :gender
  json.url user_url(user, format: :json)
end
