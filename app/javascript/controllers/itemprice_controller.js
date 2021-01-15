import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "price" ]

  connect() {
    console.log('Hello, Stimulus!')
  }

  initialize() {
    this.initialPrice = parseInt(this.element.getAttribute("data-initialPrice"))
  }

  updatePrice() {
      console.log('clicked ' + this.priceTarget)
      this.priceTarget.textContent = `${event.target.value * this.initialPrice}`
  }
}