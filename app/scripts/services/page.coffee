'use strict'

angular.module('votifiAngularApp')
  .factory 'Page', ['$resource', '$http', '$q', 'ezfb', 'Globals', ($resource, $http, $q, ezfb, Globals) ->

    getPages: ->
      @savedPages()

    savedPages: ->
      deferred = $q.defer()

      $http.get('/data/pages.json',
        cache: true
      ).success((data) ->
        deferred.resolve data
      ).error((error) ->
        deferred.reject error
      )

      deferred.promise

    lookupFbPage: (page) ->
      deferred = $q.defer()
      $http.get('https://graph.facebook.com/' + page.fbPageId,
        cache: true,
        params:
          access_token: page.fbPageAccessToken
      ).success((data) ->
        deferred.resolve data
      ).error((error) ->
        deferred.reject error
      )
      deferred.promise

    findPage: (pid, pages) ->
      pages.filter (page) ->
        page.fbPageId is pid

  ]
