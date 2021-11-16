# Hide free shipping by default unless rules are met
HIDE_FREE_SHIPPING = true

# Default cart minimums to receive free shipping. Only change if needed.
DEFAULT_MINIMUM = Money.new(cents: 100) * 1000000.00

# VIP tags. Change as needed.
VIP_CUSTOMER_TAGS = ['swell_vip_silver', 'swell_vip_gold']

# Returns whether or not the customer should receive free shipping
def qualifies_for_free_shipping?
  
  # Adjust default shipping rate based on customer tag
  customer = Input.cart.customer
  
  if customer
    
    if customer.tags.include?("swell_vip_silver")
      DEFAULT_MINIMUM = Money.new(cents: 100) * 75.00
    end
    
    if customer.tags.include?("swell_vip_gold")
      DEFAULT_MINIMUM = Money.new(cents: 100) * 75.00
    end
  
  end
  
  # Determine if the order qualifies for free shipping...
  
  # Case: Cart total is greater than the default minimum
  if Input.cart.subtotal_price >= DEFAULT_MINIMUM
    HIDE_FREE_SHIPPING = false
  end
  
end


# Does the order qualify for free shipping?
qualifies_for_free_shipping?

# Remove free shipping rates if applicable. This works by displaying all shipping rates with the word FREE in it. 
Input.shipping_rates.delete_if do |shipping_rate|
  shipping_rate.name.upcase.include?("FREE") && HIDE_FREE_SHIPPING
end


# Output the manipulated shipping rates
Output.shipping_rates = Input.shipping_rates
