'use strict'

angular.module('votifiAngularApp')
  .service 'offCanvasPanelService', ->
    self = @
    openScope = null

    @open = (offCanvasScope) ->
      unless openScope
        $document.bind 'click', closePanel
        openScope.isOpen = false if openScope and openScope isnt offCanvasScope
        openScope = offCanvasScope
        return

    @close = (offCanvasScope) ->
      if openScope is offCanvasScope
        openScope = null
        $document.unbind 'click', closePanel
        return

    closePanel = (event) ->
      if event and event.isDefaultPrevented()
        return
      openScope.$apply ->
        openScope.isOpen = false
        return
      return

  .directive 'offCanvasPanel', ->
    template: '<div></div>'
    restrict: 'EA'
    link: (scope, element, attrs) ->
      element.text 'this is the offCanvasPanel directive'

  .directive 'mainContent', ->
    restrict: 'EA',
    template: '<div></div>',
    link: (scope, element, attrs) ->
      console.dir element

  .directive 'offCanvasPanelButton', ->
    restrict: 'EA',
    template: '<div></div>',
    link: (scope, element, attrs) ->
      console.dir element