'use strict'

angular.module('votifiAngularApp')
  .controller 'QuestionsCtrl', ['Question', 'Page', '$scope', '$q', '$modal', 'Globals', (Question, Page, $scope, $q, $modal, Globals) ->

    Question.getQuestions().then (data) ->
      $scope.questionData = data.questions

    Page.getPages().then (data) ->
      angular.forEach data, (d) ->
        Page.lookupFbPage(d).then (res) ->
          d.fbPage = res
      $scope.pages = data

    $scope.open = (question) ->
      modalInstance = $modal.open
        templateUrl: 'views/questionmodal.html'
        controller: QuestionModalCtrl
        resolve:
          question: ->
            question
          pages: ->
            $scope.pages


  ]


QuestionModalCtrl = ($scope, $modalInstance, question, pages) ->
  $scope.question = question
  $scope.pages = pages
  $scope.post = {}
  $scope.publish = ->
    console.dir $scope.post
  $scope.cancel = ->
    $modalInstance.dismiss('cancel')