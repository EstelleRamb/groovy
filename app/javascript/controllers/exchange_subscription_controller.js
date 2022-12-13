import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"


export default class extends Controller {
  static targets = ["messages"]
  static values = { exchangeId: Number, currentUserId: Number }

  connect() {
    this.channel = createConsumer().subscriptions.create(
      { channel: "ExchangeChannel", id: this.exchangeIdValue },
      { received: message => this.#insertMessageAndScrollDown(message) }
    )
  }
  
  #justifyClass(currentUserIsSender) {
    return currentUserIsSender ? "justify-content-end" : "justify-content-start"
  }
  
  #userStyleClass(currentUserIsSender) {
    return currentUserIsSender ? "sender-style" : "receiver-style"
  }
  
  #buildMessageElement(currentUserIsSender, message) {
    return `
    <div class="message-row d-flex ${this.#justifyClass(currentUserIsSender)}">
    <div class="${this.#userStyleClass(currentUserIsSender)}">
    ${message}
    </div>
    </div>
    `
  }
  
  #insertMessageAndScrollDown(data) {
    console.log(this.currentUserIdValue, data.sender_id)
    const currentUserIsSender = this.currentUserIdValue === data.sender_id
    const messageElement = this.#buildMessageElement(currentUserIsSender, data.message)
    this.messagesTarget.insertAdjacentHTML("beforeend", messageElement)
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