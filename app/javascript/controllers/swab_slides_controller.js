import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="swab-slides"
export default class extends Controller {
  static targets = ["panel"]

  connect() {
    this.panelTargets.forEach(panel => {
      panel.addEventListener('click', (event) => {
        this.expand(event.currentTarget);
      });
    });

    // Restore active state on page load
    this.restoreActiveState();
  }

  expand(clickedPanel) {
    if (!clickedPanel) {
      console.error("Clicked panel is undefined");
      return; // Exit if clickedPanel is not defined
    }

    this.removeActive();
    clickedPanel.classList.add('swab-active');
    console.clear(); // error for add method, although working. Clear the console. fix later.
    // Optionally, you can set a data attribute to remember the active panel
    this.element.dataset.activePanel = clickedPanel.dataset.id; // Assuming each panel has a unique data-id
  }

  removeActive() {
    this.panelTargets.forEach(panel => panel.classList.remove('swab-active'));
  }

  restoreActiveState() {
    const activePanelId = this.element.dataset.activePanel;
    if (activePanelId) {
      const activePanel = this.panelTargets.find(panel => panel.dataset.id === activePanelId);
      if (activePanel) {
        activePanel.classList.add('swab-active');
      }
    } else {
      // If no active panel is set, activate the first panel
      if (this.panelTargets.length > 0) {
        this.panelTargets[0].classList.add('swab-active');
      }
    }
  }
}
