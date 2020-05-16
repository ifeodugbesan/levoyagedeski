import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["chatContainer", "messages", "mobile"]

  connect() {
    if (this.hasMobileTarget) {
      if (navigator.standalone) {
        this.mobileTarget.style.height = `${window.innerHeight - 140}px`
      } else {
        this.mobileTarget.style.height = `${window.innerHeight - 66}px`
      }
    }
  }

  switchConversation(event) {
    let [data, status, xhr] = event.detail;
    let chatContainer = this.chatContainerTarget
    chatContainer.innerHTML = xhr.response
    let messages = this.messagesTarget
    messages.scrollTop = messages.scrollHeight;
    event.target.firstElementChild.firstElementChild.classList.remove('border-red');
  }
}
