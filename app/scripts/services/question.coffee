'use strict'

angular.module('votifiAngularApp')
.factory 'Question', ['$resource', '$http', '$q', '$angularCacheFactory', 'Globals', ($resource, $http, $q, $angularCacheFactory, Globals) ->

    getQuestions: () ->
      deferred = $q.defer()

      $http.get('/data/questions.json',
        cache: true
      ).success (data) ->
        deferred.resolve data

      deferred.promise

  ]