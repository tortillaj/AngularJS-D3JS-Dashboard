'use strict'

angular.module('votifiAngularApp')
.factory 'Poll', ['$resource', '$http', '$q', 'Globals', ($resource, $http, $q, Globals) ->

    getPolls: ->
      deferred = $q.defer()

      $http.get('/data/polls.json',
        cache: true
      ).success((data) ->
        deferred.resolve data
      ).error((error) ->
        deferred.reject error
      )

      deferred.promise

  ]
