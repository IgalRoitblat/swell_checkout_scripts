# swell_checkout_scripts
Common Swell redemption options at checkout

JS (Front End):

1. cart-page-redemption.js - Dropdown for fixed amount redemption options. Implement this on cart page or cart popout (slider).
2. cart_fixed_amount_redemption_script.js - Implemented on the cart page in Shopify, along with the ruby redemption script for cart_fixed_amoun. Used in accounts with subscription products, where you can't implement redemption options at checkout.
3. redirect-after-account-creation - Script to be added in theme.liquid when requested to redirect on login.
4. shopify-checkout-redemption-dropdown.liquid - Dropdown for fixed amount redemption options. Implement this on checkout page.
5. shopify-checkout-slider.liquid - Slider for the variable redemption option. Implement this on checkout page.

Ruby (Cart / Checkout Logic):

1. redemption_script.rb - This script is to be used for cart_fixed_amount redemptions OR free_product redemptions. Implement this in the Shopify script editor.
2. sample-tier-based-discount-script.rb - Script to implement conditional discount based on VIP tier status and Shopify product tag.
3. shipping-script.rb - Script to implement tier based shipping discount.
4. min_cart_amount_coupon_restriction.rb - Use this script to restrict coupons to a minimum cart amount in Shopify.
