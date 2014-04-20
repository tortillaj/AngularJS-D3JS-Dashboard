'use strict'

angular.module('votifiAngularApp')

.constant 'sidebarConfig',
    openClass: 'open-sidebar'

.service 'sidebarService', ($document) ->
    self = @
    openScope = null

    @open = (sidebarScope) ->
      unless openScope
        $document.bind 'click', closeSidebar
        $document.bind 'keydown', escapeBind
        openScope.isOpen = false if openScope and openScope isnt sidebarScope
        openScope = sidebarScope
        return

    @close = (sidebarScope) ->
      if openScope is sidebarScope
        openScope = null
        $document.unbind 'click', closeSidebar
        $document.unbind 'keydown', escapeBind
        return

    closeSidebar = (event) ->
      if event and event.isDefaultPrevented()
        return
      openScope.$apply ->
        openScope.isOpen = false
        return
      return

    escapeBind = (event) ->
      if event.which is 27
        openScope.focusToggleElement
        self.closeSidebar
      return
    return

.controller 'SidebarCtrl', ($scope, $attrs, sidebarService, sidebarConfig, $animate, $parse) ->
    self = @
    scope = $scope.$new()
    setIsOpen = angular.noop
    toggleInvoker = (if $attrs.onToggle then $parse($attrs.onToggle) else angular.noop)
    openClass = sidebarConfig.openClass

    @init = (element) ->
      self.$element = element
      self.$element.sidebar()
      if $attrs.isOpen
        getIsOpen = $parse($attrs.isOpen)
        self.setIsOpen = getIsOpen.assign
        $scope.$watch getIsOpen, (value) ->
          scope.isOpen = !!value
          return
      return

    @toggle = () ->
      $scope.isOpen = !$scope.isOpen
      # self.$element.sidebar 'toggle'
      return

    # Allow other directives to know if the sidebar is open
    @isOpen = ->
      $scope.isOpen
      # return

    scope.focusToggleElement = ->
      self.toggleElement[0].focus if self.toggleElement

    scope.$watch 'isOpen', (isOpen, wasOpen) ->
      if isOpen
        $animate.addClass self.$element, openClass
        scope.focusToggleElement()
        sidebarService.open scope
      else
        $animate.removeClass self.$element, openClass
        sidebarService.close scope
      setIsOpen $scope, isOpen
      self.$element.attr 'aria-expanded', !!isOpen
      if angular.isDefined(wasOpen) and isOpen isnt wasOpen
        toggleInvoker $scope,
          open: !!isOpen

      return

    $scope.$on '$locationChangeSuccess', ->
      scope.isOpen = false
      return

    $scope.$on '$destroy', ->
      scope.$destroy()
      return

    return

.directive 'sidebar', ->
    controller: 'SidebarCtrl',
    restrict: 'EA',
    scope:
      isOpen: '=?',
      onToggle: '&'
    link: (scope, element, attrs, sidebarCtrl) ->
      sidebarCtrl.init element.find('.ui.sidebar')
      return

.directive 'sidebarToggle', ->
    require: '^sidebar',
    restrict: 'EA',
    link: (scope, element, attrs, sidebarCtrl) ->
      return if not sidebarCtrl

      sidebarCtrl.toggleElement = element

      toggleSidebar = (event) ->
        event.preventDefault
        if not element.hasClass('disabled') and not attrs.disabled
          scope.$apply ->
            sidebarCtrl.toggle !sidebarCtrl.isOpen
            return
        return

      element.bind 'click', toggleSidebar

      scope.$on '$destroy', ->
        element.unbind 'click', toggleSidebar
        return
      return