if webshims
  webshims.setOptions 'forms-ext', {
    date:
      openOnMouseFocus: true
      classes: 'show-yearbtns'
      waitReady: false
      debug: true
  }
  webshims.polyfill 'forms forms-ext'