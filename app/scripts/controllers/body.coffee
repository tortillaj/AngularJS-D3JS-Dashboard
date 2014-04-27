'use strict'

angular.module('votifiAngularApp')
.controller 'BodyCtrl', ['$rootScope', '$scope', '$document', '$location', 'Colorbrewer', 'Facebook', 'Globals', 'Account', 'ezfb', '$q',
    ($rootScope, $scope, $document, $location, Colorbrewer, Facebook, Globals, Account, ezfb, $q) ->
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
      $rootScope.$on '$routeChangeSuccess', (event, current, previous) ->
        $scope.messages = []


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
        ezfb.login(null, {scope: Globals.fbPermissions}).then () ->
          window.location.reload()

      $scope.getLoginStatus = ->
        Facebook.getLoginSatus().then (res) ->
          if res
            $scope.loginStatus = res[0]
            $scope.me = res[1][0]
            $scope.$emit('fb.login', res)

      #$scope.getLoginStatus()

      return
  ]