json.array!(@furnitures) do |furniture|
  json.extract! furniture, :id, :title, :tag, :picture1, :picture2, :picture3, :picture4, :price, :description, :email, :phone, :latitude, :longitude
  json.url furniture_url(furniture, format: :json)
end
