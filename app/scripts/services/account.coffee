'use strict'

angular.module('votifiAngularApp')
  .factory 'Account', ['$resource', '$http', '$q', 'Globals', ($resource, $http, $q, Globals) ->

    getAccount: ->
      deferred = $q.defer()

      $http.get('/data/account.json',
        cache: true
      ).success (data) ->
        deferred.resolve data

      deferred.promise

  ]
