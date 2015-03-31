json.array!(@droids) do |droid|
  json.extract! droid, :id, :droid_name, :price
  json.url droid_url(droid, format: :json)
end
