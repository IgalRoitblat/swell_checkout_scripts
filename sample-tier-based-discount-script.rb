@tenPercent = Decimal.new(10) / 100.0
@twentyPercent = Decimal.new(20) / 100.0

Input.cart.line_items.each do |line_item|
product = line_item.variant.product
customer = Input.cart.customer
SWELL_TIER_3 = "swell_vip_tier3_name"
SWELL_TIER_2 = "swell_vip_tier2_name"
PRODUCT_TAG_1 = "product_tag1_name"
PRODUCT_TAG_2 = "product_tag2_name"

if customer
    if customer.tags.include?(SWELL_TIER_3)
      if product.tags.include?(PRODUCT_TAG_1)
        line_discount = line_item.line_price * @twentyPercent
        line_item.change_line_price(line_item.line_price - line_discount, message: "20% Off for VIP tier")
      end
    end
    if customer.tags.include?(SWELL_TIER_2)
      if product.tags.include?(PRODUCT_TAG_2)
        line_discount = line_item.line_price * @tenPercent
        line_item.change_line_price(line_item.line_price - line_discount, message: "10% Off for VIP tier")
      end
    end
end
end

Output.cart = Input.cart