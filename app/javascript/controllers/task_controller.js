import { Controller } from "stimulus"

export default class extends Controller {
    static targets = ["link"]

    toggle(event) {
        event.preventDefault()
        fetch(this.data.get("url"), {
            method: "PUT",
            headers: {
                "Accept": "text/html",
                "X-CSRF-Token": document.querySelector("meta[name=csrf-token]").content,
            },
            credentials: "same-origin",
        })
            .then(response => response.text())
            .then(html => {
                const parser = new DOMParser()
                const doc = parser.parseFromString(html, 'text/html')
                const newLink = doc.querySelector(`[data-task-id='${this.data.get("id")}']`)
                this.linkTarget.replaceWith(newLink)
            })
    }
}