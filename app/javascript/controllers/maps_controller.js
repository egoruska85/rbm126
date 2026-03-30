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
