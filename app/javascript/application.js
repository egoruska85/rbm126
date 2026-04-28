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

document.addEventListener("DOMContentLoaded", () => {
  const modal = document.getElementById("imageModal");
  const modalImg = document.getElementById("modalImage");

  modal.addEventListener("show.bs.modal", function (event) {
    const trigger = event.relatedTarget;
    const imgUrl = trigger.getAttribute("data-img-url");
    modalImg.src = imgUrl;
  });
});


document.addEventListener("turbo:load", function() {
  // Находим все алерты
  const alerts = document.querySelectorAll('.custom-alert');

  alerts.forEach(function(alert) {
    // Через 5 секунд запускаем скрытие
    setTimeout(function() {
      if (alert) {
        // Используем встроенный метод Bootstrap для плавного закрытия
        const bsAlert = new bootstrap.Alert(alert);
        bsAlert.close();
      }
    }, 5000);
  });
});
