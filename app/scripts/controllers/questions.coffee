'use strict'

angular.module('votifiAngularApp')
  .controller 'QuestionsCtrl', ['Question', 'Page', '$scope', '$log', '$modal', 'Globals', (Question, Page, $scope, $log, $modal, Globals) ->

    Question.getQuestions().then (data) ->
      $scope.questionData = data.questions

    Page.getPages().then (data) ->
      $scope.pages = data
      for p in [0...$scope.pages]
        Page.lookupFbPage($scope.pages[p].fbPageId, $scope.pages[p].fbPageAccessToken).then (data) ->
          $scope.pages[p].fbPage = data

    $scope.open = (question) ->
      console.dir $scope.pages
      modalInstance = $modal.open
        templateUrl: 'views/questionmodal.html',
        controller: QuestionModalCtrl,
        resolve:
          question: ->
            question
          pages: ->
            $scope.pages

      modalInstance.result.then ((selectedItem) ->
        $log.info "Modal opened at: " + new Date()
      ), ->
        $log.info "Modal dismissed at: " + new Date()


  ]


QuestionModalCtrl = ($scope, $modalInstance, question) ->
  $scope.question = question
  $scope.post = {}
  $scope.cancel = ->
    $modalInstance.dismiss('cancel')