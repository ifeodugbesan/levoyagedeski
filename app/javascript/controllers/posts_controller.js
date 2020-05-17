import { Controller } from "stimulus"
import $ from 'jquery'

export default class extends Controller {
  static targets = ["postCard"]

  connect() {
  }

  toggleLike() {
    let [data, status, xhr] = event.detail;
    event.target.parentElement.parentElement.innerHTML = xhr.response;
  }

  newComment() {
    let [data, status, xhr] = event.detail;
    console.log(event.target.previousElementSibling.lastElementChild)
    event.target.previousElementSibling.lastElementChild.insertAdjacentHTML('beforeend', xhr.response);
    let moreComments = document.querySelector(`.post-modal_${event.target.dataset.id}`)
    let modalComments = document.querySelector(`.post-modal-comments-box_${event.target.dataset.id}`)
    modalComments.insertAdjacentHTML('beforeend', xhr.response);
    console.log(moreComments)
    let numId = parseInt(moreComments.dataset.count, 10)
    if (moreComments) {
      console.log(moreComments.innerText)
      moreComments.innerText = `view all ${numId + 1} comments`
      moreComments.dataset.count = (numId + 1).toString();
    }
    event.target.reset();
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
      console.log(moreComments.innerText)
      moreComments.innerText = `view all ${numId + 1} comments`;
      moreComments.dataset.count = (numId + 1).toString();
    }
    event.target.reset();
  }
}
