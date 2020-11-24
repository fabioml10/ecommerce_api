json.coupons do
  json.array! @coupons, :id, :code, :status, :due_date, :discount_value
end
