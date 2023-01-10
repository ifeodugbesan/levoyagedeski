import { Controller } from "stimulus"
import $ from 'jquery'

export default class extends Controller {
  static targets = [
                    "pwaPopup", "pwaUnderlay", "pwaHomeNavbar", "loader", "loaderUnderlay",
                    "minHeightDiv", "switch", "switchPwa", "webPost", "pwaPost"
                   ]

  connect() {
    if (window.innerWidth < 577) {
        this.minHeightDivTarget.style.minHeight = `${window.innerHeight - 81}px`;
    }
    if (navigator.standalone) {
      this.pwaHomeNavbarTarget.classList.remove('d-none');
      this.webPostTarget.remove();
    } else {
      this.pwaPostTarget.remove();
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
    this.loaderTarget.style.display = 'inline-block';
    this.loaderUnderlayTarget.style.display = 'block';
  }

  toggleDarkMode() {
    this.switchTarget.classList.toggle('switch-dark')
    setTimeout(function() {
      window.location.reload(true)
    }, 100)
  }

  toggleDarkModePwa() {
    this.switchPwaTarget.classList.toggle('switch-dark')
    this.loaderTarget.style.display = 'inline-block';
    this.loaderUnderlayTarget.style.display = 'block';
    setTimeout(function() {
      window.location.reload(true)
    }, 600)
  }
}
