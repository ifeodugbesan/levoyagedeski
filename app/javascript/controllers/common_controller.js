import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "pwaPopup",
                     "pwaUnderlay"
                   ]

  connect() {
    console.log('Connect. Who dis?')
  }

  hide() {
    const underlay = this.pwaUnderlayTarget
    const pwaPopup = this.pwaPopupTarget
    this.pwaUnderlayTarget.style.opacity = 0
    this.pwaPopupTarget.style.top = '100vh'
    setTimeout(function() {
      underlay.style.display = 'none'
      pwaPopup.style.display = 'none'
    }, 300)
  }

}
