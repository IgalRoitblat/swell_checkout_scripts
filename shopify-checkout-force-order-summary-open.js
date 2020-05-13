/// force order summary tab to open on mobile in Shopify checkout.

if ($(window).width() < 1000) {
 $(".order-summary-toggle--show").click()
}
$(window).resize(function() {
  if ($(window).width() < 1000) {
     $(".order-summary-toggle--show").click()
  }
});