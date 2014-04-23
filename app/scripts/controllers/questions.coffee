'use strict'

angular.module('votifiAngularApp')
  .controller 'QuestionsCtrl', ['Question', '$scope', 'Globals', (Question, $scope, Globals) ->

    Question.getQuestions().then (data) ->
      $scope.questionData = data.questions

  ]