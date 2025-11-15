// app/javascript/controllers/music/credits_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [
    "content",
    "arrow",
    "songTitle",
    "artistName",
    "imageCredit",
    "imageCreditName",
    "imageCreditUrl",
    "imageLicense",
    "audioSource",
    "audioSourceUrl",
    "audioLicense",
    "additionalCredits",
    "additionalCreditsText",
    "noCredits"
  ]

  connect() {
    console.log("Credits controller connected")
    document.addEventListener("music:credits:update", this.updateCredits.bind(this))
  }

  disconnect() {
    document.removeEventListener("music:credits:update", this.updateCredits.bind(this))
  }

  toggle() {
    const isExpanded = this.contentTarget.style.maxHeight && this.contentTarget.style.maxHeight !== "0px"

    if (isExpanded) {
      // Collapse
      this.contentTarget.style.maxHeight = "0px"
      this.arrowTarget.style.transform = "rotate(0deg)"
    } else {
      // Expand - set to scrollHeight to show all content
      this.contentTarget.style.maxHeight = this.contentTarget.scrollHeight + "px"
      this.arrowTarget.style.transform = "rotate(180deg)"
    }
  }

  updateCredits(event) {
    console.log("Credits update received:", event.detail)
    const {
      title,
      artist,
      imageCredit,
      imageCreditUrl,
      imageLicense,
      audioSource,
      audioLicense,
      additionalCredits
    } = event.detail

    // Update song title and artist (always show)
    this.songTitleTarget.textContent = title || "-"
    this.artistNameTarget.textContent = artist || "-"

    // Track if we have any credits
    let hasCredits = false

    // Update image credit
    if (imageCredit || imageCreditUrl) {
      hasCredits = true
      this.imageCreditTarget.classList.remove("hidden")
      this.imageCreditNameTarget.textContent = imageCredit || "Unknown Artist"

      if (imageCreditUrl) {
        this.imageCreditUrlTarget.href = imageCreditUrl
        this.imageCreditUrlTarget.classList.remove("hidden")
      } else {
        this.imageCreditUrlTarget.classList.add("hidden")
      }

      if (imageLicense) {
        this.imageLicenseTarget.textContent = imageLicense
        this.imageLicenseTarget.classList.remove("hidden")
      } else {
        this.imageLicenseTarget.classList.add("hidden")
      }
    } else {
      this.imageCreditTarget.classList.add("hidden")
    }

    // Update audio source
    if (audioSource) {
      hasCredits = true
      this.audioSourceTarget.classList.remove("hidden")

      // audioSource is actually the URL
      if (audioSource) {
        this.audioSourceUrlTarget.href = audioSource
        this.audioSourceUrlTarget.classList.remove("hidden")
      } else {
        this.audioSourceUrlTarget.classList.add("hidden")
      }

      if (audioLicense) {
        this.audioLicenseTarget.textContent = audioLicense
        this.audioLicenseTarget.classList.remove("hidden")
      } else {
        this.audioLicenseTarget.classList.add("hidden")
      }
    } else {
      this.audioSourceTarget.classList.add("hidden")
    }

    // Update additional credits
    if (additionalCredits) {
      hasCredits = true
      this.additionalCreditsTarget.classList.remove("hidden")
      this.additionalCreditsTextTarget.textContent = additionalCredits
    } else {
      this.additionalCreditsTarget.classList.add("hidden")
    }

    // Show/hide "no credits" message
    if (hasCredits) {
      this.noCreditsTarget.classList.add("hidden")
    } else {
      this.noCreditsTarget.classList.remove("hidden")
    }

    // Update maxHeight if already expanded to accommodate new content
    if (this.contentTarget.style.maxHeight && this.contentTarget.style.maxHeight !== "0px") {
      this.contentTarget.style.maxHeight = this.contentTarget.scrollHeight + "px"
    }
  }
}
