// app/javascript/controllers/focal_point_picker_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [
    "picker",
    "image",
    "marker",
    "xInput",
    "yInput",
    "xDisplay",
    "yDisplay"
  ]

  connect() {
    console.log("Focal point picker connected")
    console.log("Has xInput target:", this.hasXInputTarget)
    console.log("Has yInput target:", this.hasYInputTarget)
    // Initialize marker position from input values
    this.updateMarkerPosition()
  }

  handleClick(event) {
    console.log("Focal point clicked!")
    if (!this.hasImageTarget) {
      console.log("No image target found")
      return
    }

    const rect = this.imageTarget.getBoundingClientRect()
    const x = (event.clientX - rect.left) / rect.width
    const y = (event.clientY - rect.top) / rect.height

    // Clamp values between 0 and 1
    const clampedX = Math.max(0, Math.min(1, x))
    const clampedY = Math.max(0, Math.min(1, y))

    console.log("Focal point set to:", clampedX, clampedY)

    // Update hidden fields
    this.xInputTarget.value = clampedX
    this.yInputTarget.value = clampedY

    // Update display
    this.xDisplayTarget.textContent = (clampedX * 100).toFixed(1)
    this.yDisplayTarget.textContent = (clampedY * 100).toFixed(1)

    // Update marker position
    this.markerTarget.style.left = (clampedX * 100) + '%'
    this.markerTarget.style.top = (clampedY * 100) + '%'
  }

  updateMarkerPosition() {
    if (!this.hasMarkerTarget || !this.hasXInputTarget || !this.hasYInputTarget) return

    const x = parseFloat(this.xInputTarget.value) || 0.5
    const y = parseFloat(this.yInputTarget.value) || 0.5

    this.markerTarget.style.left = (x * 100) + '%'
    this.markerTarget.style.top = (y * 100) + '%'
  }
}
