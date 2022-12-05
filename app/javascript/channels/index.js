// Load all the channels within this directory and all subdirectories.
// Channel files must be named *_channel.js.

const channels = require.context('.', true, /_channel\.js$/)
channels.keys().forEach(channels)

window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const addTaxDom = document.getElementById("add-tax-price");
    // console.log(priceInput.innerHTML);
    addTaxDom.innerHTML = Math.floor(priceInput.value * 0.1 );
    const addPofitDom = document.getElementById("profit");
    // console.log(priceInput.innerHTML);
    addPofitDom.innerHTML = Math.floor(priceInput.value - Math.floor(priceInput.value * 0.1 ))
  })
});