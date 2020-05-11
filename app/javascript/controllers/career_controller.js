import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [
                    "input",
                    "title",
                    "salary",
                    "members"
                   ]

  connect() {
    const input = this.inputTarget
    const title = this.titleTarget
    const salary = this.salaryTarget
    const members = this.membersTarget
    if (input.value == "Job") {
      title.innerHTML = "Job"
      salary.classList.remove('d-none')
      members.classList.add('d-none')
    } else if (input.value == "Project") {
      title.innerHTML = "Project"
      salary.classList.add('d-none')
      members.classList.remove('d-none')
    } else {
      title.innerHTML = "Career"
    }
  }

  changeType() {
    const input = this.inputTarget
    const title = this.titleTarget
    const salary = this.salaryTarget
    const members = this.membersTarget
    if (input.value == "Job") {
      title.innerHTML = "Job"
      salary.classList.remove('d-none')
      members.classList.add('d-none')
    } else if (input.value == "Project") {
      title.innerHTML = "Project"
      salary.classList.add('d-none')
      members.classList.remove('d-none')
    } else {
      title.innerHTML = "Career"
    }
  }


}
