import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.warning = true 
application.debug = false 
window.Stimulus   = application

export { application }
