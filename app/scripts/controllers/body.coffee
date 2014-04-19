'use strict'

angular.module('votifiAngularApp')
  .controller 'BodyCtrl', ($scope, $document) ->
    $scope.toggleSidebar = ->
      $document.find('.ui.sidebar').sidebar 'toggle'
      return

    return