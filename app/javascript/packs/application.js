// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("raty-js")
require("cloudinary")






window.Noty = require("noty")
window.Dropzone = require("dropzone")
window.BulmaCarousel = require("bulma-extensions/bulma-carousel/dist/js/bulma-carousel")

window.Calendar = require("@fullcalendar/core").Calendar;
window.DayGridPlugin = require("@fullcalendar/daygrid").default;
window.ListPlugin = require("@fullcalendar/list").default;



$(document).on('turbolinks:load',() => {
  $('.toggle').on('click', (e) => {
    e.stopPropagation();
    e.preventDefault();
    $('#' + e.target.getAttribute('aria-controls')).toggleClass('is-hidden')
  })
})




// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

require("trix")
require("@rails/actiontext")