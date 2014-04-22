'use strict'

angular.module('votifiAngularApp')
  .factory 'Cluster', ['$resource', '$http', 'Globals', ($resource, $http, Globals) ->
    getClusters: () ->
      [
        total: 512 + 253 + 99
        datas: [
          {
            key: "Cluster 1"
            y: 512
          }
          {
            key: "Cluster 2"
            y: 253
          }
          {
            key: "Cluster 3"
            y: 99
          }
        ]
      ]
  ]