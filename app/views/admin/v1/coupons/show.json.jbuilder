json.coupon do
  json.(@coupon, :id, :code, :status, :due_date, :discount_value)
end
