import { Controller } from "stimulus"
import $ from 'jquery'

export default class extends Controller {
  static targets = ["postCard", "heart", "modal", "flash", "button"]

  connect() {
    if (navigator.standalone) {
      this.modalTargets.forEach((modal) => modal.style.top = `65px`);
    }
  }

  toggleLike() {
    let [data, status, xhr] = event.detail;
    event.target.parentElement.parentElement.innerHTML = xhr.response;
  }

  showLikeToggle() {
    const like = event.target.nextElementSibling
    const overlay = event.target
    like.style.zIndex = '50';
    overlay.style.zIndex = '0';

    setTimeout(function() {
      like.style.zIndex = '0';
      overlay.style.zIndex = '50';
    }, 300)
  }

  doubleClickToggleLike() {
    let likeToggle = document.getElementById(`like-toggle_${event.target.dataset.id}`)
    let heart = event.target.parentElement.lastElementChild
    likeToggle.click();
    heart.style.animation = 'likeheart 0.7s ease'
    setTimeout(function() {
      heart.style.animation = ''
    }, 700)
  }

  newComment() {
    let [data, status, xhr] = event.detail;
    event.target.previousElementSibling.lastElementChild.insertAdjacentHTML('beforeend', xhr.response);
    let moreComments = document.querySelector(`.post-modal_${event.target.dataset.id}`)
    let modalComments = document.querySelector(`.post-modal-comments-box_${event.target.dataset.id}`)
    modalComments.insertAdjacentHTML('beforeend', xhr.response);
    if (moreComments) {
      let numId = parseInt(moreComments.dataset.count, 10)
      moreComments.innerText = `view all ${numId + 1} comments`
      moreComments.dataset.count = (numId + 1).toString();
    }
    event.target.reset();
    event.target.lastElementChild.classList.remove('post-submit')
    // SHOW CUSTOM FLASH
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

  newCommentModal() {
    let [data, status, xhr] = event.detail;
    const messageBox = event.target.parentElement.previousElementSibling.lastElementChild;
    messageBox.insertAdjacentHTML('beforeend', xhr.response);
    $(messageBox).animate({ scrollTop: messageBox.scrollHeight }, 300);
    let comments = document.querySelector(`.post-comments-box_${event.target.dataset.id}`)
    comments.insertAdjacentHTML('beforeend', xhr.response);
    let moreComments = document.querySelector(`.post-modal_${event.target.dataset.id}`)
    let numId = parseInt(moreComments.dataset.count, 10)
    if (moreComments) {
      moreComments.innerText = `view all ${numId + 1} comments`;
      moreComments.dataset.count = (numId + 1).toString();
    }
    event.target.reset();
    event.target.lastElementChild.classList.remove('post-submit')
    // SHOW CUSTOM FLASH
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

  postButton() {
    if (!event.target.value == "") {
      event.target.parentElement.nextElementSibling.classList.add('post-submit')
    } else {
      event.target.parentElement.nextElementSibling.classList.remove('post-submit')
    }
  }
}
