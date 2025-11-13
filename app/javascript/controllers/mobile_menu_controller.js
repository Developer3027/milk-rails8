import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="mobile-menu"
export default class extends Controller {
  static targets = ["menu", "hamburger"]

  connect() {
  }

  /**
   * Toggles the visibility of the mobile menu. If the menu is hidden, it calls the `open` method to display it;
   * otherwise, it calls the `close` method to hide it.
   */
  toggleMenu() {
    if (this.menuTarget.classList.contains("hidden")) {
      this.open()
    } else {
      this.close()
    }
  }

  /**
   * Opens the mobile menu by removing the 'hidden' class, adds a blur to the main section,
   * and prevents body scrolling.
   */
  open() {
    this.menuTarget.classList.remove("hidden")
    this.hamburgerTarget.setAttribute("aria-expanded", "true")

    const main = document.querySelector("section")
    if (main) {
      main.classList.add("blur-sm")
    }

    document.body.classList.add("overflow-hidden")
  }

  /**
   * Closes the mobile menu by adding the 'hidden' class, removes the blur from the main section,
   * and restores body scrolling. This is also called when a menu item is clicked.
   */
  close() {
    this.menuTarget.classList.add("hidden")
    this.hamburgerTarget.setAttribute("aria-expanded", "false")

    const main = document.querySelector("section")
    if (main) {
      main.classList.remove("blur-sm")
    }

    document.body.classList.remove("overflow-hidden")
  }

  /**
   * Closes the menu when a navigation link is clicked.
   * This ensures the menu closes after user makes a selection.
   */
  closeOnNavigate() {
    this.close()
  }
}
