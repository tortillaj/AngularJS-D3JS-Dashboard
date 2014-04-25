'use strict'

angular.module('votifiAngularApp')
  .controller 'QuestionsCtrl', ['Question', '$scope', '$log', '$modal', 'Globals', (Question, $scope, $log, $modal, Globals) ->

    Question.getQuestions().then (data) ->
      $scope.questionData = data.questions

    $scope.open = (question) ->
      console.dir question
      modalInstance = $modal.open
        templateUrl: 'views/questionmodal.html',
        controller: QuestionModalCtrl,
        resolve:
          question: ->
            question

      modalInstance.result.then ((selectedItem) ->
        $log.info "Modal opened at: " + new Date()
      ), ->
        $log.info "Modal dismissed at: " + new Date()


  ]


QuestionModalCtrl = ($scope, $modalInstance, question) ->
  $scope.question = question
  $scope.cancel = ->
    $modalInstance.dismiss('cancel')