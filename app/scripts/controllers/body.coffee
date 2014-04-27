'use strict'

angular.module('votifiAngularApp')
.controller 'BodyCtrl', ['$scope', '$document', '$location', 'Colorbrewer', 'Globals', 'Account', 'ezfb', '$q',
    ($scope, $document, $location, Colorbrewer, Globals, Account, ezfb, $q) ->
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

      $scope.messages = []
      $scope.exitMessage = (index) ->
        $scope.messages.splice(index, 1)

      ##
      #
      # Account Related
      #
      ##
      Account.getAccount().then (data) ->
        $scope.account = data

      ##
      #
      # Facebook Related
      #
      ##
      $scope.loginFB = ->
        ezfb.login(null, {scope: Globals.fbPermissions})

      _updateFBStatus = ->
        ezfb.getLoginStatus().then(->
          ezfb.api '/me'
        ).then (me) ->
          $scope.me = me
          return

      _updateLoginStatus = ->
        ezfb.getLoginStatus().then (res) ->
          $scope.loginStatus = res

      _updateFBStatus()
      _updateLoginStatus()

      return
  ]