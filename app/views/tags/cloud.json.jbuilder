json.array!(@tags) do |tag|
  json.text tag.text
  json.weight tag.weight
  # json item "link" will be the url
  json.link tag_filter_path(tag.text)
end
