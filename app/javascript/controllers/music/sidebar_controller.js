// sidebar_controller for options menu in Zuke header
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "link", "menu" ]

  connect() {
    const observer = new MutationObserver((mutations) => {
      if (this.hasLinkTarget && this.linkTargets.length > 0) {
        this.setActive(this.linkTargets[0])
        observer.disconnect()
      }
    })
  
    observer.observe(this.element, {
      childList: true,
      subtree: true
    })
  
    // Fallback timeout in case observer doesn't trigger
    setTimeout(() => {
      if (this.hasLinkTarget && !observer.disconnected) {
        this.setActive(this.linkTargets[0])
        observer.disconnect()
      }
    }, 500)
  }

  setActive(event) {
    // If event is a mouse event, get the target element
    const element = event.currentTarget || event
    
    // Remove active class from all links
    this.linkTargets.forEach(link => {
      link.classList.remove("bg-[#FFC9A4]")
    })
    
    // Add active class to clicked link
    element.classList.add("bg-[#FFC9A4]")
  }

  toggleMenu() {
    this.menuTarget.classList.toggle("hidden")
  }

  closeMenu(e) {
    if (!this.element.contains(e.target)) {
      this.menuTarget.classList.add("hidden")
    }
  }
}
