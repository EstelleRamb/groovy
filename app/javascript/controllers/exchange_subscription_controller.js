import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="chatroom-subscription"
export default class extends Controller {
  static targets = ["messages"]
  static values = { exchangeId: Number }

  connect() {
    this.channel = createConsumer().subscriptions.create(
      { channel: "ExchangeChannel", id: this.exchangeIdValue },
      { received: message => this.#insertMessageAndScrollDown(message) }
    )
  }
  
  #insertMessageAndScrollDown(message) {
    this.messagesTarget.insertAdjacentHTML("beforeend", message)
    this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight)
  }
  

  resetForm(event) {
    event.target.reset()
  }

  disconnect() {
    console.log("Déconnecté...");
    this.channel.unsubscribe()
   }
}