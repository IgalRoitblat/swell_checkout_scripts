  $(document).ready(function () {
      $(document).on("swell:initialized", function () {
          console.log("swell:initialized");
          $(".fixed-amount").append($("<option>").attr('value', 'starter').text("Choose your rewards"))
          spapi.activeRedemptionOptions.forEach(option => {
              if (option.discount_type === "fixed_amount") {
                  $(".fixed-amount").append(
                      $("<option>").text(`${option.prettyDiscount} Off`).attr({
                          "data-redemption-option-id": option.id
                      }).val(option.id).addClass("swell-redemption-link")
                  )
              }
              $(".swell-cart-element input").click((e) => {
                 e.preventDefault();
                $("option:selected").click();
              })
          })
      });
  });
