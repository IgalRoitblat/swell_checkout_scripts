# swell_checkout_scripts

Common Swell redemption options at checkout

JS (Front End):

1. cart-page-redemption.js - Dropdown for fixed amount redemption options. Implement this on cart page or cart popout (slider).
2. cart_fixed_amount_redemption_script.js - Implemented on the cart page in Shopify, along with the ruby redemption script for cart_fixed_amoun. Used in accounts with subscription products, where you can't implement redemasdsadasdasption options at checkout.
3. redirect-after-account-creation - Script to be added in theme.liquid when requested to redirect on login.
4. shopify-checkout-redemption-dropdown.liquid - Dropdown for fixed amount redemption options. Implement this on checkout page.
5. shopify-checkout-slider.liquid - Slider for the variable redemption option. Implement this on checkout page.
6. shopify-checkout-apply-point-balance.liquid - Apply all available balance button for checkout.
7. shopify-checkout-force-order-summary-open.js - Forces order summary to open on mobile in the Shopify Checkout.
8. loyaltyOptInCodeSetup.html - Adding a checkbox to allow users to opt-in the rewards program on Shopify using local storage.
9. redirectToRewardsOnClick.js - Redirect to rewards page on login or signup made from the rewards page.
10. post-purchase-module-implementation.html - Implement the post purhcase popup layout module in the checkout page.
11. post-purhcase-non-popup-module-implementation.html - Implement a normal referral module layout as popup in the checkout page.
12. Loyalty Opt In option via SDK. This file is split into two sections, the first should go in register.liquid and the second in account.liquid to give users the option to opt-in or out of loyalty.

Ruby (Cart / Checkout Logic):

1. redemption_script.rb - Tasdhis script is to be used for cart_fixed_amount redemptions OR free_product redemptions. Implement this in the Shopify script editor.
2. sample-tier-based-discount-script.rb - Script to implement conditional discount based on VIP tier status and Shopify product tag.
3. shipping-script.rb - Script to implement tier based shipping discount.
4. min_cart_amount_coupon_restriction.rb - Use this script to restrict coupons to a minimum cart amount in Shopify.
5. redemption_script_with_product.rb - This script is to be used for stores that have both cart_fixed_amount redemptions AND free_product redemptions. Implement this in the Shopify script editor.
