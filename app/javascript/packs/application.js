//= require jquery3
//= require popper
//= require bootstrap

import * as bootstrap from 'bootstrap';
import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()


document.addEventListener('turbolinks:load', () => {
  let alertsList = [].slice.call(document.querySelectorAll('.alert-dismissible'))
  let closeAlerts = alertsList.map((alert) => {
    let dismissButton = document.createElement('button')
    dismissButton.classList.add('btn-close')
    dismissButton.setAttribute("type", "button");
    dismissButton.setAttribute("aria-label", "Close");
    dismissButton.setAttribute("data-bs-dismiss", "alert");
    alert.appendChild(dismissButton)
  })

  var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
  var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
    return new bootstrap.Tooltip(tooltipTriggerEl)
  })

  var popoverTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="popover"]'))
  var popoverList = popoverTriggerList.map(function (popoverTriggerEl) {
    return new bootstrap.Popover(popoverTriggerEl)
  })
})