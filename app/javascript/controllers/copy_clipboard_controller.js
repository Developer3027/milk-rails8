import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="copy-clipboard"
export default class extends Controller {
  copyColor(event) {
    const colorText = event.currentTarget.innerText; // Get the text of the clicked item
    const colorMatch = colorText.match(/(#\w{6}|#\w{3})/); // Regex to match hex color

    if (colorMatch) {
      const color = colorMatch[0]; // Extract the hex color
      navigator.clipboard.writeText(color) // Copy to clipboard
        .then(() => {
          this.showNotification(`Copied ${color} to clipboard!`); // Show notification
        })
        .catch(err => {
          console.error('Failed to copy: ', err);
        });
    } else {
      console.error('No valid color found.');
    }
  }

  showNotification(message) {
    const notification = document.getElementById('notification');
    notification.innerText = message; // Set the notification message
    notification.classList.remove('hidden');
    notification.classList.add('visible');

    // Automatically hide the notification after 3 seconds
    setTimeout(() => {
      notification.classList.remove('visible');
      notification.classList.add('hidden');
    }, 3000);
  }
}
