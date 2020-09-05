import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ['container', 'contents']

  connect() {
  }

  updateResults() {
    let page = document.querySelector('.tab-active').innerText
    let [data, status, xhr] = event.detail;
    this.containerTarget.innerHTML = xhr.response
    let contents = this.contentsTargets
    contents.forEach((content) => {
      content.classList.remove('resource-active')
      content.style.display = 'none';
    })
    contents.forEach((content) => {
      if (content.dataset.name === page) {
        content.classList.add('resource-active')
        content.style.display = 'block';
      }
    })
  }
}
