import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["postCard"]

  connect() {
  }

  toggleLike() {
    let [data, status, xhr] = event.detail;
    event.target.parentElement.parentElement.innerHTML = xhr.response
  }
}
