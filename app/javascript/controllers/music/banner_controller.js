// app/javascript/controllers/music/banner_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["image", "title", "subtitle"]

  connect() {
    document.addEventListener("music:banner:update", this.updateBanner.bind(this))
  }

  disconnect() {
    document.removeEventListener("music:banner:update", this.updateBanner.bind(this))
  }

  updateBanner(event) {
    const { image, imageMobile, title, subtitle } = event.detail

    // Choose the appropriate image based on screen size
    const isMobile = window.innerWidth < 768
    const selectedImage = (isMobile && imageMobile) ? imageMobile : (image || null)

    // Only update if we have a valid image URL
    if (selectedImage && selectedImage !== '' && !this.imageTarget.src.endsWith(selectedImage)) {
      // Start transition to fade out
      this.imageTarget.style.opacity = 0;

      const handleTransitionEnd = () => {
        // Update image src directly
        this.imageTarget.src = selectedImage;

        // Show loading state if image takes time to load
        this.imageTarget.onload = () => {
          // Force reflow and fade in
          void this.imageTarget.offsetWidth;
          this.imageTarget.style.opacity = 1;
          this.imageTarget.onload = null; // Clean up
        };

        // Fallback in case onload doesn't fire
        setTimeout(() => {
          if (this.imageTarget.complete) {
            void this.imageTarget.offsetWidth;
            this.imageTarget.style.opacity = 1;
          }
        }, 500);

        this.imageTarget.removeEventListener("transitionend", handleTransitionEnd);
      };

      this.imageTarget.addEventListener("transitionend", handleTransitionEnd);
    }

    if (title) this.titleTarget.textContent = title;
    if (subtitle) this.subtitleTarget.textContent = subtitle;
  }
}
