'use strict'

angular.module('votifiAngularApp')
.controller 'AppsCtrl',
    ['Page', 'Facebook', '$scope', '$q', '$modal', 'Globals', (Page, Facebook, $scope, $q, $modal, Globals) ->
      Page.getPages().then (data) ->
        angular.forEach data, (d) ->
          Page.lookupFbPage(d).then (res) ->
            d.fbPage = res
        $scope.pages = data

      Facebook.getLoginSatus().then (res) ->
        if res
          $scope.loginStatus = res[0]
          $scope.me = res[1][0]
          Facebook.fetchPages($scope.loginStatus).then (pages) ->
            $scope.apps = pages

      $scope.open = (question) ->
        modalInstance = $modal.open
          templateUrl: 'views/appmodal.html'
          controller: 'AppModalCtrl'
          resolve:
            messages: ->
              $scope.messages
            apps: ->
              $scope.apps
            loginStatus: ->
              $scope.loginStatus
            me: ->
              $scope.me

    ]

angular.module('votifiAngularApp')
.controller 'AppModalCtrl',
    ['$scope', '$modalInstance', 'Facebook', 'Poll', 'messages', 'apps', 'loginStatus', 'me',
      ($scope, $modalInstance, Facebook, Poll, messages, apps, loginStatus, me) ->
        $scope.messages = messages
        $scope.apps = apps.data
        $scope.new = {}

        Poll.getPolls().then (polls) ->
          $scope.polls = polls

        $scope.create = ->
          Facebook.createTab($scope.new, $scope.apps, loginStatus).then (response) ->
            if (response[0] is true)
              $scope.messages.push({ type: 'success', content: 'Your new app has been added!' })
              $scope.cancel()

        $scope.cancel = ->
          $modalInstance.dismiss('cancel')
    ]