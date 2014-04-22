'use strict'

angular.module('votifiAngularApp')
.factory 'Node', ['$resource', '$http', 'Globals', ($resource, $http, Globals) ->
    getNodes: () ->
      [
        trending:
          datas: [
            key: "Trending"
            values: [
              ["Budget|How do you feel about the budget?", 34],
              ["Economy|How do you feel about the economy?", 39],
              ["Culture|What is good culture?", 24],
              ["Constitution|Have you read the Constitution?", 44],
              ["Energy|Should we invest in finding new energy sources?", 31],
              ["Transportation|How do you travel to work?", 49]
            ]
          ]

      ]

  ]