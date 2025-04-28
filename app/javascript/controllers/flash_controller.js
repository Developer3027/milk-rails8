import { Controller } from "@hotwired/stimulus"

// Flash controller for alerts and notices of app
// Will fade out flash messages after 3 seconds
// Prevents messages from hanging out until pages is refreshed.
export default class extends Controller {
  /**
   * After connecting, set a 3 second timer to hide the flash message.
   * This prevents messages from lingering until the page is refreshed.
   */
  connect() {
    setTimeout(() => {
      this.hide();
    }, 3000); // 3000 milliseconds = 3 seconds
  }

/**
 * Fades out the flash message by transitioning its opacity to 0 over 1 second,
 * then removes the element from the DOM after the transition completes.
 */
  hide() {
    this.element.style.transition = "opacity 1s";
    this.element.style.opacity = "0";
    setTimeout(() => {
      this.element.remove();
    }, 1000); // Wait for the transition to finish before removing the element
  }

  /**
   * Event handler for the `animationend` event. Removes the element from the
   * DOM after the fade-out transition has completed.
   * @param {AnimationEvent} event The animation event object.
   */
  remove(event) {
    if (event.animationName === "fadeOut") {
      this.element.remove();
    }
  }
}