// Import and register all your controllers from the importmap under controllers/*

import { application } from "./application"

// Eager load all controllers defined in the import map under controllers/**/*_controller
// import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
// import { eagerLoadControllersFrom } from "@hotwired/stimulus"
// eagerLoadControllersFrom("controllers", application)

// Lazy load controllers as they appear in the DOM (remember not to preload controllers in import map!)
// import { lazyLoadControllersFrom } from "@hotwired/stimulus-loading"
// lazyLoadControllersFrom("controllers", application)


import Task_controller from "./task_controller";
application.register("task", Task_controller)

import modal_controller from "./modal_controller";
application.register("modal", modal_controller)