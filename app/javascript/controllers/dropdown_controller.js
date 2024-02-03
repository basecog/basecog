import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  HIDDEN_CLASS = "hidden"

  static targets = ["menu", "item"]

  toggle(event) {
    event.preventDefault()

    if (this._isHidden()) {
      this._show()
    } else {
      this._hide()
    }
  }

  hide(event) {
    const clickedMenuItem = this.itemTargets.some((itemTarget) => itemTarget.contains(event.target))

    if (!this.element.contains(event.target) || clickedMenuItem) {
      this._hide()
    }
  }

  disconnect() {
    this._hide()
  }

  // private

  _isHidden() {
    return this.menuTarget.classList.contains(this.HIDDEN_CLASS)
  }

  _show() {
    this.menuTarget.classList.remove(this.HIDDEN_CLASS)
  }

  _hide() {
    this.menuTarget.classList.add(this.HIDDEN_CLASS)
  }
}
