######
## This script enables line items price adjustments for Yotpo's loyalty products.
## In order to use script, you have to first install Shopify's Script Editor app.
##
## Embed this script in a blank template in Script Editor, and make sure to fill in 'reverse_api_key' in line 15.
##
## Last updated: August 1st, 2021
######

swell_discount_amount_cents = nil
swell_discount_used = false

def calculate_token(point_redemption_id, variant_id)
 # Fill in your loyalty api key in reverse in the line below
 reverse_api_key = ""
 buckets = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
 raw_token = variant_id.to_s.reverse + reverse_api_key + point_redemption_id.to_s.reverse
 token = ""
 rotate_amount = 1 + (point_redemption_id.to_i % 59)
 
 raw_token.each_char do |char|
  ord = char.ord
  
  # "A" to "Z"
  if ord >= 65 and ord <= 90
   orig_index = ord-65
  elsif ord >= 97 and ord <= 122
   orig_index = ord - 97 + 26
  elsif ord >= 48 and ord <= 57
   orig_index = ord - 48 + 52
  else
   orig_index = false
  end
  
  if orig_index
   new_index = (orig_index + rotate_amount) % 62
   token += buckets[new_index]
  end
 end
 
 return token
end

# handle fixed amount discounts
# we store the discount amount on the first non-free item in the cart
# and then later we distribute the discount evenly across all remaining line items
Input.cart.line_items.each do |line_item|
  discount_type = line_item.properties["_swell_discount_type"]
  point_redemption_id = line_item.properties["_swell_redemption_id"]
  point_redemption_token = line_item.properties["_swell_redemption_token"]
  discount_amount_cents = line_item.properties["_swell_discount_amount_cents"]

  if discount_type && discount_type.eql?("cart_fixed_amount")
    if calculate_token(point_redemption_id, '') == point_redemption_token
      swell_discount_amount_cents = discount_amount_cents.to_i
      swell_discount_used = true
    end
  end
end

Input.cart.line_items.each do |line_item|
  points_used = line_item.properties["_swell_points_used"]
  discount_type = line_item.properties["_swell_discount_type"]
  point_redemption_id = line_item.properties["_swell_redemption_id"]
  point_redemption_token = line_item.properties["_swell_redemption_token"]
  variant_id = line_item.variant.id
  is_free_product = false
  
  # if there's a free product, reduce the price of this line item by the price of the product
  if discount_type && discount_type.eql?("product")
    if calculate_token(point_redemption_id, variant_id) == point_redemption_token
      total_line_item_price_cents = line_item.line_price_was.cents
      each_item_price_cents = total_line_item_price_cents / line_item.quantity
      new_price = total_line_item_price_cents - each_item_price_cents
      line_item.change_line_price(Money.new(cents: new_price), message: "Rewards")
      is_free_product = true
    end
  end

  # if there's a fixed amount discount and this isn't a free product
  # distribute the fixed amount discount based on the percentage of the total this line item represents
  if swell_discount_used and !is_free_product
    price_cents = line_item.line_price_was.cents
    cart_cents = Input.cart.subtotal_price_was.cents

    Input.cart.line_items.each do |inner_line_item|
      if inner_line_item.properties["_swell_discount_type"].eql?("product")
        cart_cents = cart_cents - inner_line_item.line_price_was.cents
      end
    end

    discount_cents = (price_cents / cart_cents) * swell_discount_amount_cents
    line_item.change_line_price(Money.new(cents: price_cents - discount_cents), message: "Rewards")
  end
end
Output.cart = Input.cart
