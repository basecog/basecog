import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

    static values = {
        content: String
    }

    static targets = ["source", "button", "successButton"]

    connect() {
        this.originalContent = this.buttonTarget.innerHTML
    }

    disconnect() {
        clearTimeout(this.timeout)
        this._revertToOriginalContent()
    }

    copy() {
        const value = this.contentValue
        navigator.clipboard.writeText(value)

        this.buttonTarget.innerHTML = this.successButtonTarget.innerHTML
        this.timeout = setTimeout(this._revertToOriginalContent, 2000)
    }

    // private

    _revertToOriginalContent = () => {
        this.buttonTarget.innerHTML = this.originalContent
    }
}
