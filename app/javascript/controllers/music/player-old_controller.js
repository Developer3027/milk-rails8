// app/javascript/controllers/music/player_controller.js
import { Controller } from "@hotwired/stimulus"
import WaveSurfer from 'wavesurfer.js'

/**
 * Global Audio Player Controller
 * 
 * Manages the persistent audio player at the bottom of the screen, handling:
 * - Audio playback via WaveSurfer.js
 * - Time display and countdown
 * - Loading states and error recovery
 * - Cross-component communication via custom events
 */
export default class extends Controller {
  // DOM Element Targets
  static targets = [
    "nowPlaying",        // Display for current track title
    "artistName",        // Display for artist name
    "waveform",          // WaveSurfer visualization container
    "playerPlayButton",  // Play button element
    "playerPauseButton", // Pause button element
    "loadingContainer",  // Loading indicator container
    "loadingProgress",   // Loading progress bar
    "currentTime",       // Current playback time display
    "duration"           // Duration/countdown display
  ]

  // Current track URL reference
  currentUrl = null

  /**
   * Initialize the controller when connected to DOM
   * Sets up WaveSurfer instance and all event listeners
   */
  connect() {
    //this.initializeWaveSurfer()
    //this.setupEventListeners()
  }

  /**
   * Clean up when controller is disconnected
   * Prevents memory leaks and stops audio playback
   */
  disconnect() {
    this.destroyWaveSurfer()
  }

  // ========================
  //  Core Functionality
  // ========================

  /**
   * Initialize WaveSurfer audio instance
   * Configures visualization and basic event handlers
   */
  initializeWaveSurfer() {
    this.wavesurfer = WaveSurfer.create({
      container: this.waveformTarget,
      waveColor: "#00B1D1",
      progressColor: "#01DFB6",
      height: 50,
      minPxPerSec: 50,
      hideScrollbar: true,
      autoScroll: true,
      autoCenter: true,
      dragToSeek: true,
      barWidth: 2,
      barGap: 1,
      barRadius: 2,
      responsive: true,
      backend: 'WebAudio', // More reliable than MediaElement
      closeAudioContext: true // Force context release
    })

    this.setupWaveSurferEvents()
  }

  /**
   * Set up all WaveSurfer event listeners
   */
  setupWaveSurferEvents() {
    // Playback state events
    this.wavesurfer.on('ready', this.handleTrackReady.bind(this))
    this.wavesurfer.on('play', this.handlePlay.bind(this))
    this.wavesurfer.on('pause', this.handlePause.bind(this))
    this.wavesurfer.on('finish', this.handleTrackEnd.bind(this))
    
    // Loading progress events
    this.wavesurfer.on('loading', this.handleLoadingProgress.bind(this))
    this.wavesurfer.on('error', this.handleAudioError.bind(this))
    
    // Time updates
    this.wavesurfer.on('timeupdate', this.updateTimeDisplay.bind(this))
  }

  /**
   * Set up custom event listeners
   */
  setupEventListeners() {
    window.addEventListener('audio:play', this.handlePlayEvent.bind(this))
    window.addEventListener('audio:pause', this.handlePauseEvent.bind(this))
  }

  // ========================
  //  Event Handlers
  // ========================

  /**
   * Handle track loaded and ready to play
   */
  handleTrackReady() {
    try {
      this.playerPlayButtonTarget.classList.add('hidden')
      this.playerPauseButtonTarget.classList.remove('hidden')
      this.durationTarget.textContent = this.formatTime(this.wavesurfer.getDuration())
      this.updateTimeDisplay(0)
      this.hideLoadingIndicator()
      
      // Auto-play only if user has previously interacted - (this.canAutoPlay)
      // if (this.canAutoPlay) {
        this.wavesurfer.play()
      // }
    } catch (error) {
      console.error('Error handling track ready:', error)
      this.handleAudioError()
    }
  }

  /**
   * Handle play event from WaveSurfer
   */
  handlePlay() {
    this.playerPlayButtonTarget.classList.add('hidden')
    this.playerPauseButtonTarget.classList.remove('hidden')
    window.dispatchEvent(new CustomEvent('audio:playing', { 
      detail: { playing: true, url: this.currentUrl }
    }))
  }

  /**
   * Handle pause event from WaveSurfer
   */
  handlePause() {
    this.playerPlayButtonTarget.classList.remove('hidden')
    this.playerPauseButtonTarget.classList.add('hidden')
    window.dispatchEvent(new CustomEvent('audio:playing', { 
      detail: { playing: false, url: this.currentUrl }
    }))
  }

  /**
   * Handle track ending naturally
   */
  handleTrackEnd() {
    this.handlePause()
    window.dispatchEvent(new CustomEvent('audio:ended', {
      detail: { url: this.currentUrl }
    }))
  }

  /**
   * Handle external play event (from song cards)
   * @param {Event} e - Custom audio:play event
   */
  handlePlayEvent(e) {
    try {
      const { url, title, artist } = e.detail
      this.nowPlayingTarget.textContent = title || 'Unknown Track'
      this.artistNameTarget.textContent = artist || 'Unknown Artist'

      if (!this.wavesurfer || this.currentUrl !== url) {
        this.currentUrl = url
        this.loadTrack(url)
      } else {
        this.togglePlayback()
      }
    } catch (error) {
      console.error('Error handling play event:', error)
      this.handleAudioError()
    }
  }

  /**
   * Handle loading progress updates
   * @param {number} progress - Loading percentage (0-100)
   */
  handleLoadingProgress(progress) {
    this.loadingContainerTarget.classList.remove('hidden')
    this.loadingProgressTarget.style.width = `${progress}%`
    
    if (progress === 100) {
      this.loadingProgressTarget.classList.add('transition-none')
      setTimeout(() => {
        this.loadingProgressTarget.style.width = '100%'
      }, 10)
    }
  }

  /**
   * Handle audio errors
   */
  handleAudioError() {
    console.error('Audio playback error')
    this.hideLoadingIndicator()
    this.playerPlayButtonTarget.classList.remove('hidden')
    this.playerPauseButtonTarget.classList.add('hidden')
    
    // Notify other components
    window.dispatchEvent(new CustomEvent('audio:error', {
      detail: { url: this.currentUrl }
    }))
  }

  // ========================
  //  Public Methods
  // ========================

  /**
   * Toggle between play and pause states
   */
  togglePlayback() {
    try {
      this.wavesurfer.playPause()
    } catch (error) {
      console.error('Error toggling playback:', error)
      this.handleAudioError()
    }
  }

  /**
   * Force-clean audio loading for S3 files
   */
  loadTrack(url) {
    try {
      // 1. Immediate UI update
      this.showLoadingIndicator()
      this.currentTimeTarget.textContent = '0:00'
      this.durationTarget.textContent = '-0:00'

      // 2. Stop and empty current audio
      this.wavesurfer?.stop()
      this.wavesurfer?.empty() // Critical for S3 files

      // 3. Small delay to ensure cleanup (S3-specific)
      setTimeout(() => {
        this.wavesurfer.load(url)
        
        // 4. Post-load verification
        this.wavesurfer.once('ready', () => {
          if (this.wavesurfer.getDuration() <= 0.1) {
            this.handleAudioError()
          }
        })
      }, 50)
      
    } catch (error) {
      console.error('S3 track loading failed:', error)
      this.handleAudioError()
    }
  }

  empty() {
    if (this.wavesurfer) {
      this.wavesurfer.backend?.disconnect()
      this.wavesurfer.backend?.ac?.close() // Close audio context
    }
  }

  // ========================
  //  UI Helpers
  // ========================

  /**
   * Format seconds into MM:SS display
   * @param {number} seconds - Time in seconds
   * @returns {string} Formatted time string
   */
  formatTime(seconds) {
    const mins = Math.floor(seconds / 60)
    const secs = Math.floor(seconds % 60).toString().padStart(2, '0')
    return `${mins}:${secs}`
  }

  /**
   * Update time displays
   * @param {number} currentTime - Current playback position in seconds
   */
  updateTimeDisplay(currentTime) {
    this.currentTimeTarget.textContent = this.formatTime(currentTime)
    
    if (this.wavesurfer.getDuration()) {
      const remaining = this.wavesurfer.getDuration() - currentTime
      this.durationTarget.textContent = `-${this.formatTime(remaining)}`
    }
  }

  /**
   * Show loading indicator
   */
  showLoadingIndicator() {
    this.loadingContainerTarget.classList.remove('hidden')
    this.loadingProgressTarget.style.width = '0%'
    this.loadingProgressTarget.classList.remove('transition-none')
  }

  /**
   * Hide loading indicator
   */
  hideLoadingIndicator() {
    this.loadingContainerTarget.classList.add('hidden')
    this.loadingProgressTarget.style.width = '0%'
    this.loadingProgressTarget.classList.remove('transition-none')
  }

  // ========================
  //  Cleanup
  // ========================

  /**
   * Properly destroy WaveSurfer instance
   */
  destroyWaveSurfer() {
    if (this.wavesurfer) {
      try {
        this.wavesurfer.pause()
        this.wavesurfer.destroy()
        this.wavesurfer = null
      } catch (error) {
        console.error('Error destroying WaveSurfer:', error)
      }
    }
  }

  // ========================
  //  Getters
  // ========================

  /**
   * Check if autoplay is permitted
   */
  // get canAutoplay() {
  //   return document.body.dataset.audioAutoplay === 'true'
  // }
}