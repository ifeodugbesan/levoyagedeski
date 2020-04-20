import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [
                    "input",
                    "title",
                   ]

  connect() {
    const input = this.inputTarget
    const title = this.titleTarget
    if (input.value == "Job") {
      title.innerHTML = "Job"
    } else if (input.value == "Project") {
      title.innerHTML = "Project"
    } else {
      title.innerHTML = "Career"
    }
  }

  changeType() {
    console.log("change type. who dis?")
    const input = this.inputTarget
    const title = this.titleTarget
    if (input.value == "Job") {
      title.innerHTML = "Job"
    } else if (input.value == "Project") {
      title.innerHTML = "Project"
    } else {
      title.innerHTML = "Career"
    }
  }
}
