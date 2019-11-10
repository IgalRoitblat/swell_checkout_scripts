# swell_checkout_scripts
Common Swell redemption options at checkout

JS (Front End):

a. cart-page-redemption.js - Dropdown for fixed amount redemption options. Implement this on cart page or cart popout (slider).
b. cart_fixed_amount_redemption_script.js - Implemented on the cart page in Shopify, along with the ruby redemption script for cart_fixed_amoun. Used in accounts with subscription products, where you can't implement redemption options at checkout.
c. redirect-after-account-creation - Script to be added in theme.liquid when requested to redirect on login.
d. shopify-checkout-redemption-dropdown.liquid - Dropdown for fixed amount redemption options. Implement this on checkout page.
e. shopify-checkout-slider.liquid - Slider for the variable redemption option. Implement this on checkout page.

Ruby (Cart / Checkout Logic):

a. redemption_script.rb - This script is to be used for cart_fixed_amount redemptions OR free_product redemptions. Implement this in the Shopify script editor.
b. sample-tier-based-discount-script.rb - Script to implement conditional discount based on VIP tier status and Shopify product tag.
c. shipping-script.rb - Script to implement tier based shipping discount.
