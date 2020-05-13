import { Controller } from "stimulus"
import Pusher from 'pusher-js';
import $ from 'jquery'

export default class extends Controller {
  static targets = ["container", "messages", "form"]

  connect() {
    const container = this.containerTarget
    const messages = this.messagesTarget
    messages.scrollTop = messages.scrollHeight;
    const key = this.containerTarget.dataset.key
    const currentUser = this.containerTarget.dataset.currentUser
    const cluster = this.containerTarget.dataset.cluster
    let pusher = new Pusher(key, {
      cluster: cluster,
      forceTLS: true
    });
    let channel = pusher.subscribe('my-channel');
    channel.bind('my-event', function(data) {
      if (data.user_id == currentUser) {
        return;
      }
      let newEntry = `
                      <div class="each-message py-1 justify-content-start">
                        <img src="https://res.cloudinary.com/${data.cloud}/image/upload/${data.avatar}" class="avatar-large" alt="user-avatar">
                        <div class="" style="max-width: 77%;">
                          <div class="message-body ml-2 speech-left">
                            ${data.body}
                          </div>
                          <p class="time-created tiny-text lighter mr-3 mb-0 text-right">now</p>
                        </div>
                      </div>
                      `
      messages.insertAdjacentHTML('beforeend', newEntry);
      setTimeout(function() {
        document.querySelector('.time-created').innerText = `${data.created_at}`
      }, 10000)
    });
  }

  newMessage() {
    const messages = this.messagesTarget
    let [data, status, xhr] = event.detail;
    messages.insertAdjacentHTML('beforeend', xhr.response);
    this.formTarget.reset();
    $(messages).animate({ scrollTop: messages.scrollHeight }, 300);
  }
}
