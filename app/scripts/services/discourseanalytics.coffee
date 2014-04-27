'use strict'

angular.module('votifiAngularApp')
  .factory 'DiscourseAnalytics', ['$http', '$q', 'Globals', ($http, $q, Globals) ->

    createFacebookApp: (details) ->
      deferred = $q.deferred()
      $http.post('/apps/createfacebookapp',
        details
      ).success (data) ->
        deferred.resolve data

      deferred.promise

    createFacebookPost: (details) ->
      deferred = $q.deferred()
      $http.post('/questions/createfacebookpost',
        details
      ).success (data) ->
        deferred.resolve data

      deferred.promise

  ]
