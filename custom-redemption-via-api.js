// The following code was custom built for TheBetterGeneration (https://thebettergeneration.com/pages/tier-3)
// In order to use, a custom action must first be created in the loyalty admin with an action name that must match a classname of a div. 
// Then, a div element must be created with the className swell-custom-action and the custom action name, for example size_15 is the name of the custom action on the div and in the admin
//     <div class='swell-custom-action size_15'>
//       <p class="action-size"> Size 15</p>
//       <p class="redeem-cta">REDEEM 1,000 POINTS</p>
//     </div>

document.querySelectorAll('.swell-custom-action').forEach(ele => {
    ele.onclick = function(){callToSwell(ele, ele.classList[1])}
})

let customerEmail = `test@yotpo.com`
let userAgent = "User-agent header sent: " + navigator.userAgent;
  
function callToSwell(ele, customActionName){
  let data = {
    "type": "CustomAction",
    "customer_email": customerEmail,
    "action_name": customActionName,
    "user_agent": userAgent,
    "guid": 'XXX-GUID-XXX',
    'api_key': 'XXX-APIKEY-XXX',
  };
  
  fetch('https://loyalty.yotpo.com/api/v2/actions', {
            method: 'POST',
      		credentials: 'same-origin',
      		mode: 'cors',
            headers: {
                'Content-Type': 'application/json',
              	'Accept': '*/*'
            },
            body: JSON.stringify(data),
        })
        .then(response => response.json())
        .then(data => {
            console.log('Success:', data);
    		ele.innerHTML = 'Successfully Redeemed!'
        })
        .catch((error) => {
            console.error('Error:', error);
    		ele.innerHTML = 'Something went wrong'
        });
}

  $(document).one("swell:setup", function() {
    console.log('swell:setup')
  	let customerPoints = swellAPI.getCustomerDetails().pointsBalance;
    
    if (customerPoints >= 1000) {
      caButtonS4.style.display = "block"
    }
  })
