//The functions below handle redirect to the rewards page upo clicking the signup / login  buttons on the rewards page in Shopify.

// This function goes on the rewards page. It receives the button selector, name of storage key (string), value to set to local storage (string).
function setToLocalStorage(btnSelector, storageKey, storageValue) {
    $(btnSelector).click(() => localStorage.setItem(storageKey, storageValue));
}

// This function goes on the account page. It receives the  desired redirect url, name of storage key to get from local storage (string), value to redirect on (string).
function getFromLocalStorage(redirectUrl, storageKey, storageValue) {
    if (localStorage.getItem(storageKey) == storageValue) {
        localStorage.clear();
        window.location.href = redirectUrl;
    }
}
