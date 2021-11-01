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


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";


var jQuery = require('jquery')

global.$ = global.jQuery = jQuery;
window.$ = window.jQuery = jQuery;
// Internal imports, e.g:
import { initSelect2 } from '../plugins/init_select2.js';
import { initBarRating } from '../plugins/init_barrating.js';
import { initChatroomCable } from '../channels/chatroom_channel.js'
import { initNotificationsCable } from '../channels/notifications_channel.js'
import { initMsgUnread } from '../helpers/init_msg_unread.js'
import { markRead } from '../helpers/init_mark_read.js'
import { initTrix } from '../plugins/init_trix.js'

const Trix  = require("trix")

Trix.config.blockAttributes.heading2 = {
  tagName: 'h2',
  terminal: true,
  breakOnReturn: true,
  group: false
}
Trix.config.blockAttributes.heading3 = {
  tagName: 'h3',
  terminal: true,
  breakOnReturn: true,
  group: false
}

addEventListener("trix-initialize", event => {
  const { toolbarElement } = event.target
  const h1Button = toolbarElement.querySelector("[data-trix-attribute=heading1]")
  h1Button.insertAdjacentHTML("afterend", `
    <button type="button" class="trix-button" data-trix-attribute="heading2" title="Heading 2" tabindex="-1" data-trix-active="">H2</button>
  `)
  const h2Button = toolbarElement.querySelector("[data-trix-attribute=heading2]")
  h2Button.insertAdjacentHTML("afterend", `
    <button type="button" class="trix-button" data-trix-attribute="heading3" title="Heading 3" tabindex="-1" data-trix-active="">H3</button>
  `)
})


///////////////////////
document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  initSelect2();
  initBarRating();
  initChatroomCable();
  initNotificationsCable();
  initMsgUnread();
  //setInterval(()=>{initMsgUnread()}, 3000);
  markRead();
  initTrix();


});

  // const init = setInterval(initMsgUnread(), 1000);
  // clearInterval(init);
  // var interval = setInterval(initMsgUnread(), 1000);

  // $(document).on('turbolinks:before-cache turbolinks:before-render', function() {
  //   clearTimeout(interval);
  // });
// $(document).ready(function() {
//   $(document).on('turbolinks:load', function() {
//     initMsgUnread();
//   })
// })
// $(document).on('turbolinks:load', function() {
//   markRead();
// })
