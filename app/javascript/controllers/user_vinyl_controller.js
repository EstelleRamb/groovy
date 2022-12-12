import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="user-vinyl"
export default class extends Controller {
  static targets = ["form"]

  connect() {}

  changeOfferForTrade() {
    this.formTarget.submit()

  }
}
