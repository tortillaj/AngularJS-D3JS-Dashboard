'use strict'

angular.module('votifiAngularApp')
  .factory 'Cluster', ['$resource', '$http', '$q', 'Globals', ($resource, $http, $q, Globals) ->
    getClusters: () ->
      deferred = $q.defer()

      $http.get('/data/clusters.json',
        cache: true
      ).success (data) ->
        deferred.resolve data

      deferred.promise
  ]