json.product do
  json.(@product, :id, :name, :description, :price, :productable_type, :productable_id)
end
