import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="onglet"
export default class extends Controller {
  static targets = ["cards", "collections","all", "playlist"]

  connect() {
    console.log("From connect");
  }


  playlist(event){

    event.preventDefault()
    console.log("From playlist");
    const cards = this.cardsTargets
    const collections = this.collectionsTargets

    cards.forEach((card) => {
      card.classList.add("d-none")
    })
    collections.forEach((collection) => {
      collection.classList.remove("d-none")
    })

    this.allTarget.style.backgroundColor = "black"
  }

  all(event){

    event.preventDefault()
    console.log("From all");
    const cards = this.cardsTargets
    const collections = this.collectionsTargets

    cards.forEach((card) => {
      card.classList.remove("d-none")
    })
    collections.forEach((collection) => {
      collection.classList.add("d-none")
    })
  }


  }
