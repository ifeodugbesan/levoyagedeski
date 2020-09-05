import { Controller } from "stimulus"
import $ from 'jquery'

export default class extends Controller {
  static targets = []

  toggleUpvote() {
    let [data, status, xhr] = event.detail;
    event.target.parentElement.innerHTML = xhr.response
  }
}
