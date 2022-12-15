import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="border-card"
export default class extends Controller {
static targets = ["cards"]

  connect() {
    console.log("from border card");
  }

  border(event){

    const cards = this.cardsTargets

    event.preventDefault()
    this.cardsTarget.classList.toggle("echange-card")

    // cards.forEach((card) => {
    //   card.classList.toggle("echange-card")
    // })

  }
}
