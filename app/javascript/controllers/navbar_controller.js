import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar"
export default class extends Controller {
  static targets = ["mobileMenu"]
  connect() {
  }
  /**
   * Toggles the visibility of the navbar content. If the content is hidden, it calls the `open` method to display it;
   * otherwise, it calls the `close` method to hide it.
   */
  toggleMenu() {
    if (this.mobileMenuTarget.classList.contains("hidden")) {
      this.open()
    } else {
      this.close()
    }
  }

  /**
   * Removes the 'hidden' class from the navbar content, adds a blur class to the main element,
   * and adds an overflow-hidden class to the body.
   */
  open() {
    this.mobileMenuTarget.classList.remove("hidden")
    let main = document.querySelector("section")
    main.classList.add("blur-sm")

    document.body.classList.add("overflow-hidden")
  }

  /**
   * Adds the 'hidden' class to the navbar content, removes the blur class from the main element,
   * and removes the overflow-hidden class from the body.
   */
  close() {
    this.mobileMenuTarget.classList.add("hidden")
    let main = document.querySelector("section")
    main.classList.remove("blur-sm")

    document.body.classList.remove("overflow-hidden")
  }
}