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
  const images = document.querySelectorAll(".zoom-img");
  const modal = document.getElementById("imageModal");
  const modalImg = document.getElementById("modalImage");

  let currentIndex = 0;

  images.forEach((img, index) => {
    img.addEventListener("click", () => {
      modal.style.display = "block";
      currentIndex = index;
      modalImg.src = img.src;
    });
  });

  document.querySelector(".next").onclick = () => {
    currentIndex = (currentIndex + 1) % images.length;
    modalImg.src = images[currentIndex].src;
  };

  document.querySelector(".prev").onclick = () => {
    currentIndex = (currentIndex - 1 + images.length) % images.length;
    modalImg.src = images[currentIndex].src;
  };

  modal.onclick = (e) => {
    if (e.target === modal) {
      modal.style.display = "none";
    }
  };
});
