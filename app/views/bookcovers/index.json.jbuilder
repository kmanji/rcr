json.array!(@bookcovers) do |bookcover|
  json.extract! bookcover, :id, :meta_tags, :user_id, :description
  json.url bookcover_url(bookcover, format: :json)
end
