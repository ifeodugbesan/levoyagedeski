import { Controller } from "stimulus"
import $ from 'jquery'

export default class extends Controller {
  static targets = []

  connect() {
  }

  toggleUpvote() {
    let [data, status, xhr] = event.detail;
    event.target.parentElement.innerHTML = xhr.response
  }
}
