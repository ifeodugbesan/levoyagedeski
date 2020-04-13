import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [
                    "pwaPopup",
                    "pwaUnderlay",
                    "pwaHomeNavbar",
                    "loader",
                    "loaderUnderlay",
                   ]

  connect() {
    console.log('Common connect. Who dis?')
    if (navigator.standalone) {
      this.pwaHomeNavbarTarget.classList.remove('d-none');
    }
    if (this.hasPwaPopupTarget) {
      const pwaUnderlay = this.pwaUnderlayTarget
      const pwaPopup = this.pwaPopupTarget
      if (!navigator.standalone) {
        setTimeout(function() {
          pwaUnderlay.style.display = 'block';
          pwaPopup.style.display = 'flex';
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

  showLoader() {
    console.log('showloader who dis?')
    this.loaderTarget.style.display = 'inline-block';
    this.loaderUnderlayTarget.style.display = 'block';
  }
}
