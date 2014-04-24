'use strict'

angular.module('votifiAngularApp')
  .controller 'BodyCtrl', ['$scope', '$document', '$location', 'Colorbrewer', 'Globals', ($scope, $document, $location, Colorbrewer, Globals) ->
    $scope.sidebar =
      isOpen: false

    $scope.toggleSidebar = ->
      $scope.sidebar.isOpen = !$scope.sidebar.isOpen

    $scope.activePage = (viewLocation) ->
      viewLocation is $location.path()

    $scope.colorPalette = (data, c) ->
      (d, i) ->
        count = c || data.length
        cb = Colorbrewer[Globals.colorBrewer]
        palette = (if (count < 9) then cb[count] else cb[9])
        if count < 3 then palette = cb[3]
        palette[i]

  ]