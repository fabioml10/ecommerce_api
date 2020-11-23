json.products do
  json.array! @products, :id, :name, :description, :price, :productable_type, :productable_id
end