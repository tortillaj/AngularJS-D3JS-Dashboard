'use strict'

angular.module('votifiAngularApp')
  .controller 'MainCtrl', ['Question', '$scope', (Question, $scope) ->
    $scope.questionData = Question.getQuestions()

    $scope.formatDateAsDayName = ->
      (d) ->
        format = d3.time.format('%A')
        format(new Date(d * 1000))

    $scope.toolTipContentFunction = ->
      (key, x, y, e, graph) ->
        '<p>' + key + ': ' + y + '</p>'

    return

  ]