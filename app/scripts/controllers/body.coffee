'use strict'

angular.module('votifiAngularApp')
  .controller 'BodyCtrl', ['$scope', '$document', '$location', 'Colorbrewer', 'Globals', ($scope, $document, $location, Colorbrewer, Globals) ->
    $scope.sidebar =
      isOpen: false

    $scope.toggleSidebar = ->
      $scope.sidebar.isOpen = !$scope.sidebar.isOpen

    $scope.activePage = (viewLocation) ->
      viewLocation is $location.path()

    $scope.colorPalette = (data) ->
      (d, i) ->
        cb = Colorbrewer[Globals.colorBrewer]
        palette = (if (data.length < 9) then cb[data.length] else cb[9])
        if data.length < 3 then palette = cb[3]
        palette[i]

  ]