// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

import "controllers"
import "bootstrap"
import { computePrice } from "../compute_price/compute_price"


import { initFlatpickr } from "../plugins/flatpickr";
import { TextRotate } from "txt-rotate";

import Turbolinks from "turbolinks"

const calendar = document.getElementById('new_reservation')

document.addEventListener("turbolinks:load", () => {
  console.log('turbo')
    if (calendar) {
      initFlatpickr();
  }
  computePrice();
});
