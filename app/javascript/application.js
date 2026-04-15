// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

import "popper"
import "bootstrap"


import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["container"]

  connect() {
    ymaps.ready(() => {
      this.map = new ymaps.Map(this.containerTarget, {
        center: [55.75, 37.61], // Москва
        zoom: 10
      })
    })
  }

  disconnect() {
    if (this.map) {
      this.map.destroy()
    }
  }
}

document.addEventListener("input", function (e) {
  if (e.target.classList.contains("messenger-textarea")) {
    e.target.style.height = "auto";
    e.target.style.height = (e.target.scrollHeight) + "px";
  }
});
