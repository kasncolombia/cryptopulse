import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="theme"
export default class extends Controller {
  static targets = [ "lightIcon", "darkIcon" ]

  connect() {
    // Check localStorage or default to dark
    if (localStorage.theme === 'dark' || (!('theme' in localStorage) && window.matchMedia('(prefers-color-scheme: dark)').matches)) {
      document.documentElement.classList.add('dark')
      this.isDark = true
    } else {
      document.documentElement.classList.remove('dark')
      this.isDark = false
    }
    
    this.updateIcons()
  }

  toggle() {
    this.isDark = !this.isDark
    
    if (this.isDark) {
      document.documentElement.classList.add('dark')
      localStorage.theme = 'dark'
    } else {
      document.documentElement.classList.remove('dark')
      localStorage.theme = 'light'
    }
    
    this.updateIcons()
  }

  updateIcons() {
    if (this.isDark) {
      this.lightIconTarget.classList.remove('hidden')
      this.darkIconTarget.classList.add('hidden')
    } else {
      this.lightIconTarget.classList.add('hidden')
      this.darkIconTarget.classList.remove('hidden')
    }
  }
}
