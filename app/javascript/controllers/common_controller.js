import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "pwaPopup",
                     "pwaUnderlay"
                   ]

  connect() {
    console.log('Connect. Who dis?')
    if (this.hasPwaPopupTarget) {
      const pwaUnderlay = this.pwaUnderlayTarget
      const pwaPopup = this.pwaPopupTarget
      setTimeout(function() {
        pwaUnderlay.style.display = 'block';
        pwaUnderlay.style.top = 0;
        pwaUnderlay.style.opacity = 1;
        if (window.innerWidth > 576) {
          pwaPopup.style.top = 'calc(50vh - 275px)';
        } else {
          pwaPopup.style.top = `calc(50vh - ${ pwaPopup.offsetHeight / 2 }px`
        }
      }, 2000);
    }
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
