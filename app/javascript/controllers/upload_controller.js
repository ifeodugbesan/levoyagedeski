import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ['']

  connect() {
    console.log("Yooooo")
    // we select the photo input
    const input = document.getElementById('photo-input');
    if (input) {
      // we add a listener to know when a new picture is uploaded
      input.addEventListener('change', () => {
        // we call the displayPreview function (who retrieve the image url and display it)
        if (input.files && input.files[0]) {
          const form = document.getElementById('post-form-container');
          form.classList.toggle('d-none');
          setTimeout(function() {
            form.classList.toggle('animate-hide');
          }, 10)

          const reader = new FileReader();
          reader.onload = (event) => {
            let mediaType = input.files[0].type.split("/")[0]
            if (input.files[0].type.split("/")[1] == 'heic') {
              document.getElementById('heic').lastElementChild.innerText = input.files[0].name
              document.getElementById('heic').classList.remove('d-none');
            } else if (mediaType == 'image') {
              document.getElementById('photo-preview').src = event.currentTarget.result;
              document.getElementById('photo-preview').classList.remove('d-none');
            }
            if (mediaType == 'video') {
              document.getElementById('video-preview').src = event.currentTarget.result;
              document.getElementById('video-preview').classList.remove('d-none');
            }
          }
          reader.readAsDataURL(input.files[0])
        }
      })
    }
  }

  hideForm() {
    const input = document.getElementById('post-form');
    const photo = document.getElementById('photo-preview')
    const video = document.getElementById('video-preview')
    const heic = document.getElementById('heic')

    input.reset();

    photo.src = ''
    photo.classList.add('d-none')
    video.src = ''
    video.classList.add('d-none')
    heic.classList.add('d-none')


    document.getElementById('post-form-container').classList.toggle('animate-hide');
    setTimeout(function() {
      document.getElementById('post-form-container').classList.toggle('d-none');
    }, 300)
  }
}
