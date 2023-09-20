import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }


import { Turbo } from "@hotwired/turbo-rails"
// import { Application } from "@hotwired/stimulus"
// import { definitionsFromContext } from "stimulus/webpack-helpers"
//
// const application = Application.start()
// const context = require.context("controllers", true, /\.js$/)
// application.load(definitionsFromContext(context))
//
// // Configure Stimulus development experience
// application.debug = false
// window.Stimulus   = application
//
// export { application }