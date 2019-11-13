### Use this script to restrict coupons to a minimum cart amount in Shopify

if Input.cart.subtotal_price < Money.new(cents:3000)
	if Input.cart.discount_code
		if Input.cart.discount_code.code.start_with? 'REF'
			Input.cart.discount_code.reject({ message: 'Cart value must be higher than $30' })
		end
	end
end
Output.cart = Input.cart