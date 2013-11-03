json.array!(@furnitures) do |furniture|
  json.extract! furniture, :title, :description, :image_url
  json.url furniture_url(furniture, format: :json)
end
