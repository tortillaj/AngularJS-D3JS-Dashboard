'use strict'

angular.module('votifiAngularApp')
  .factory 'Page', ['$resource', '$http', '$q', 'ezfb', 'Globals', ($resource, $http, $q, ezfb, Globals) ->

    getPages: ->
      deferred = $q.defer()

      $http.get('/data/pages.json',
        cache: true
      ).success (data) ->
        deferred.resolve data

      deferred.promise

    lookupFbPage: (id, token) ->
      ezfb.api('/' + id, {access_token: token}, (data) ->
        console.dir data
        data
      )


  ]
