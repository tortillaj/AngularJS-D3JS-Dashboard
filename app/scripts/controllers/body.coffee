'use strict'

angular.module('votifiAngularApp')
  .controller 'BodyCtrl', ($scope, $document, $location) ->
    $scope.sidebar =
      isOpen: false

    $scope.toggleSidebar = ->
      $scope.sidebar.isOpen = !$scope.sidebar.isOpen

    $scope.activePage = (viewLocation) ->
      viewLocation is $location.path()

    return