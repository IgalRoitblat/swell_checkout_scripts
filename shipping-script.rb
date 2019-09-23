Input.shipping_rates.each do |shipping_rate|
  next unless shipping_rate.source == "shopify"

  standard_shipping_flag = false
  
  SWELL_TIER_2 = "swell_tier_2_name"
  SWELL_TIER_3 = "swell_tier_3_name"
  SHIPPING_NAME = "shipping_rate_name"

  customer = Input.cart.customer
  if customer
    if (customer.tags.include?(SWELL_TIER_2) or customer.tags.include?(SWELL_TIER_3))
        standard_shipping_flag = true
    end
  end

  if shipping_rate.name == SHIPPING_NAME && standard_shipping_flag
    shipping_rate.apply_discount(shipping_rate.price * 1, message: "Free Shipping")
  end

end

Output.shipping_rates = Input.shipping_rates
