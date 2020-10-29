require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")
import { Application } from "stimulus"
import { definitionsFromContext } from "stimulus/webpack-helpers"

const application = Application.start()
const context = require.context("../controllers", true, /\.js$/)
application.load(definitionsFromContext(context))
import "bootstrap";

require("trix")
require("@rails/actiontext")

import hljs from 'highlight.js';
import 'highlight.js/styles/monokai-sublime.css';
import intlTelInput from 'intl-tel-input';
import 'intl-tel-input/build/css/intlTelInput.css';

hljs.configure({
  languages: ['ruby', 'javascript', 'CSS', 'HTTP', 'SCSS', 'JSON', 'YAML', 'HTML/XML', 'ERB', 'shell-session', 'bash']
});

const input = document.querySelector("#phone");

document.addEventListener('DOMContentLoaded', (event) => {
  document.querySelectorAll('pre').forEach((block) => {
    hljs.highlightBlock(block);
    block.classList.remove('angelscript')
    intlTelInput(input);
  });
});
