json.array!(@comments) do |comment|
  json.extract! comment, :id, :user_id, :topic_id, :post_id, :content, :votes, :comment_id
  json.url comment_url(comment, format: :json)
end
