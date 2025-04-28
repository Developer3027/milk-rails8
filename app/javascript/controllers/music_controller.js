import { Controller } from "@hotwired/stimulus";
// Connects to data-controller="music"
export default class extends Controller {
  static targets = [ "playIcon", "pauseIcon" ]
  static values = { url: String }

  connect() { 
    if (!window.audio) {
      window.audio = new Audio()
    }
  }
  toggle(e) {
    e.preventDefault();
    if (window.audio.src != this.urlValue) {
      window.audio.pause()
      window.audio.currentTime = 0
      window.audio.src = this.urlValue
    }

    window.dispatchEvent(new CustomEvent('audio-player-switched', {
      detail: { audio_src: this.urlValue }
    }))

    this.playIconTarget.classList.toggle("hidden")
    this.pauseIconTarget.classList.toggle("hidden")

    if (!window.audio.paused) {
      window.audio.pause()
    } else {
      window.audio.play()
    }
  }

  audioChanged(e) {
    let newUrl = e.detail.audio_src
    if (newUrl != this.urlValue) {
      if (this.playIconTarget.classList.contains("hidden")) {
        this.playIconTarget.classList.remove("hidden")
        this.pauseIconTarget.classList.add("hidden")
      }
    }
  }
}