import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  connect() {
    this.timeout = setTimeout(this._close, 5000)
  }

  disconnect() {
    clearTimeout(this.timeout)
    this._close()
  }

  // private

  _close = () => { this.element.style.opacity = 0 }
}
