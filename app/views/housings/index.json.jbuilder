json.array!(@housings) do |housing|
  json.extract! housing, :title, :description, :address, :image_url
  json.url housing_url(housing, format: :json)
end
