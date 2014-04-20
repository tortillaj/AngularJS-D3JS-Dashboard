'use strict'

angular.module('votifiAngularApp')
  .controller 'BodyCtrl', ($scope, $document) ->
    $scope.sidebar =
      isOpen: false

    $scope.toggleSidebar = ->
      $scope.sidebar.isOpen = !$scope.sidebar.isOpen

    return