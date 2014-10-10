json.array!(@stories) do |story|
  json.extract! story, :id, :title, :picture, :description, :tags, :date
  json.url story_url(story, format: :json)
end
