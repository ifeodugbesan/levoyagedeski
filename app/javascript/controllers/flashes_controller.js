import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["flash"]

  connect() {
    if (this.hasFlashTarget) {
      const flash = this.flashTarget;
      if (navigator.standalone) {
        flash.style.top = `60px`
      }
      flash.style.display = `flex`;
      $(flash).animate({ height: '45px' }, 400);
      setTimeout(function() {
      $(flash).animate({ height: '0' }, 400);
      }, 2100)
    }
  }
}
