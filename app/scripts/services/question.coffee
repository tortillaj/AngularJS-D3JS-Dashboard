'use strict'

angular.module('votifiAngularApp')
.factory 'Question', ['$resource', '$http', 'Globals', ($resource, $http, Globals) ->
    getQuestions: () ->
      [
        name: "Project 1"
        id: "project1"
        cumulative:
          sumUsers: 320
          sumInteractions: 456
        lastMonth:
          sumUsers: 456
          sumInteractions: 489
        lastWeek:
          sumUsers: 320
          sumInteractions: 456
          datas:
            [
              key: "Users"
              values: [
                [ 1397487231, 32 ],
                [ 1397573631, 36 ],
                [ 1397660031, 38 ],
                [ 1397746431, 40 ],
                [ 1397832831, 32 ],
                [ 1397919231, 30 ],
                [ 1398005631, 32 ]
              ]
            ,
              key: "Interactions"
              values: [
                [ 1397487231, 45 ],
                [ 1397573631, 56 ],
                [ 1397660031, 49 ],
                [ 1397746431, 40 ],
                [ 1397832831, 45 ],
                [ 1397919231, 47 ],
                [ 1398005631, 42 ]
              ]
            ]


      ,
        name: "Project 2"
        id: "project2"
        cumulative:
          sumUsers: 320
          sumInteractions: 456
        lastMonth:
          sumUsers: 456
          sumInteractions: 489
        lastWeek:
          sumUsers: 310
          sumInteractions: 356
          datas:
            [
              key: "Users"
              values: [
                [ 1397487231, 2 ],
                [ 1397573631, 6 ],
                [ 1397660031, 8 ],
                [ 1397746431, 4 ],
                [ 1397832831, 2 ],
                [ 1397919231, 7 ],
                [ 1398005631, 2 ]
              ]
            ,
              key: "Interactions"
              values: [
                [ 1397487231, 4 ],
                [ 1397573631, 6 ],
                [ 1397660031, 9 ],
                [ 1397746431, 4 ],
                [ 1397832831, 5 ],
                [ 1397919231, 7 ],
                [ 1398005631, 2 ]
              ]
            ]


      ]
  ]