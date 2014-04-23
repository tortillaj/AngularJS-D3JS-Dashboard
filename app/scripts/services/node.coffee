'use strict'

angular.module('votifiAngularApp')
.factory 'Node', ['$resource', '$http', '$q', 'Globals', ($resource, $http, $q, Globals) ->
    getNodes: () ->
      deferred = $q.defer()

      $http.get('/data/nodes.json',
        cache: true
      ).success (data) ->
        deferred.resolve data

      deferred.promise

  ]