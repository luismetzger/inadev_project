import { Controller } from "stimulus"

export default class extends Controller {
    connect() {
        this.element.addEventListener("turbo:click", (event) => {
            if (event.target.dataset.turboFrame == this.element.id) {
                this.open()
            }
        })

        this.element.addEventListener("turbo:frame-load", () => {
            this.close()
        })
    }

    open() {
        this.element.classList.remove('invisible');
    }

    close() {
        this.element.classList.add('invisible');
    }
}