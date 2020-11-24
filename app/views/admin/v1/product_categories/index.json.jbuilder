json.product_categories do
  json.array! @product_categories, :id, :product_id, :category_id
end

