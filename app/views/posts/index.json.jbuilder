json.array!(@posts) do |post|
  json.extract! post, :id, :user_id, :topic_id, :content, :votes
  json.url post_url(post, format: :json)
end
