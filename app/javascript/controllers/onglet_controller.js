import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="onglet"
export default class extends Controller {
  static targets = ["cards", "collections","all", "playlist","echanges"]

  connect() {
    console.log("From connect");
  }


  playlist(event){

    event.preventDefault()
    console.log("From playlist");
    const cards = this.cardsTargets
    const collections = this.collectionsTargets
    const echanges = this.echangesTargets

    cards.forEach((card) => {
      card.classList.add("d-none")
    })
    collections.forEach((collection) => {
      collection.classList.remove("d-none")
    })
    echanges.forEach((echange) => {
      echange.classList.add("d-none")
    })

    this.allTarget.classList.remove("tab")
    this.colectionTarget.classList.add("tab")
  }

  all(event){

    event.preventDefault()
    console.log("From all");
    const cards = this.cardsTargets
    const collections = this.collectionsTargets
    const echanges = this.echangesTargets

    cards.forEach((card) => {
      card.classList.remove("d-none")
    })
    collections.forEach((collection) => {
      collection.classList.add("d-none")
    })
    this.allTarget.classList.add("tab")
    this.colectionTarget.classList.remove("tab")

    echanges.forEach((echange) => {
      echange.classList.add("d-none")
    })
  }

  echange(event){

    event.preventDefault()
    console.log("From echange");
    const cards = this.cardsTargets
    const collections = this.collectionsTargets
    const echanges = this.echangesTargets

    cards.forEach((card) => {
      card.classList.add("d-none")
    })
    collections.forEach((collection) => {
      collection.classList.add("d-none")
    })

    echanges.forEach((echange) => {
      echange.classList.remove("d-none")
    })



  }

}
