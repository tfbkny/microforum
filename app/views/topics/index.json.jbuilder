json.array!(@topics) do |topic|
  json.extract! topic, :id, :title, :user_id, :archived, :votes
  json.url topic_url(topic, format: :json)
end
