import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="music"
export default class extends Controller {
  static targets = [ "playIcon", "pauseIcon" ]  // Targets: The play/pause button icons (to toggle visibility)
  static values = { url: String }              // Values: The audio URL to play (passed from HTML)

  // WHAT IT DOES: Bootstraps a global audio player if none exists.
  // TRIGGER: Automatically fires when the element with `data-controller="music"` is added to the DOM. Lazy load with Stimulus. Page load with Hotwire.
  // GOTCHAS: Using `window.audio` means only ONE audio track can play app-wide. 
  //          This is either a feature ("radio mode") or a bug ("why can't I multitask?!").
  connect() { 
    if (!window.audio) {
      window.audio = new Audio();  // Global audio instance. Lives rent-free in `window`.
    }
  }

  // WHAT IT DOES: Toggles play/pause for the current track.
  // HOW IT WORKS: 
  //   1. If the clicked track is NEW, resets player and loads the URL.
  //   2. Dispatches an event (for other controllers to react, e.g., updating UI).
  //   3. Swaps play/pause icons.
  //   4. Toggles playback.
  // GOTCHAS: 
  //   - `window.audio.paused` check is backwards logic (but works). 
  //   - Event dispatch is useful but undocumented—other components must listen for 'audio-player-switched'.
  toggle(e) {
    e.preventDefault();
    if (window.audio.src != this.urlValue) {       // New track? Reset and load.
      window.audio.pause();
      window.audio.currentTime = 0;
      window.audio.src = this.urlValue;
    }

    // Broadcast to the world (or at least other Stimulus controllers):
    window.dispatchEvent(new CustomEvent('audio-player-switched', {
      detail: { audio_src: this.urlValue }
    }));

    // Toggle icons like a DJ with commitment issues:
    this.playIconTarget.classList.toggle("hidden");
    this.pauseIconTarget.classList.toggle("hidden");

    // Play/pause logic (note: this flips the *current* state):
    if (!window.audio.paused) {
      window.audio.pause();
    } else {
      window.audio.play();
    }
  }

  // WHAT IT DOES: Listens for external audio changes (e.g., from another controller).
  // HOW IT WORKS: 
  //   - If the new URL isn't this controller's track, resets icons to "play" state.
  // GOTCHAS: 
  //   - Requires other code to dispatch 'audio-player-switched' events.
  //   - Silent failure if events are malformed.
  audioChanged(e) {
    let newUrl = e.detail.audio_src;
    if (newUrl != this.urlValue) {  // Not our track? Reset icons.
      if (this.playIconTarget.classList.contains("hidden")) {
        this.playIconTarget.classList.remove("hidden");
        this.pauseIconTarget.classList.add("hidden");
      }
    }
  }

  // WHAT IT DOES: Cleans up the audio player when this controller disconnects from the DOM.  
  // HOW IT WORKS:  
  //   - Checks if the currently playing track belongs to THIS controller's URL.  
  //   - If yes, pauses playback and resets time to 0 (avoid audio leaks).  
  // TRIGGER:  
  //   - Automatically fires when:  
  //     1. The element with `data-controller="music"` is removed from the DOM.  
  //     2. Turbo navigates away (if using Hotwire/Turbo).  
  //     3. Stimulus disconnects manually (rare).  
  // GOTCHAS:  
  //   - Does NOT destroy `window.audio`—other instances might still need it.  
  //   - Only cleans up if THIS controller's track is playing.  
  disconnect() {  
    if (window.audio.src === this.urlValue) {  
      window.audio.pause();  
      window.audio.currentTime = 0;  
    }  
  }
}