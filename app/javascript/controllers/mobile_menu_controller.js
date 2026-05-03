// app/javascript/controllers/mobile_menu_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["drawer", "iconOpen", "iconClose"]

  toggle() {
    if (this.drawerTarget.classList.contains("hidden")) {
      this.open()
    } else {
      this.close()
    }
  }

  open() {
    this.drawerTarget.classList.remove("hidden")
    document.body.classList.add("overflow-hidden")
    this.iconOpenTarget.classList.add("hidden")
    this.iconCloseTarget.classList.remove("hidden")
  }

  close() {
    this.drawerTarget.classList.add("hidden")
    document.body.classList.remove("overflow-hidden")
    this.iconOpenTarget.classList.remove("hidden")
    this.iconCloseTarget.classList.add("hidden")
  }
}
