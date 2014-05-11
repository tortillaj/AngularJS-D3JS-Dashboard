'use strict'

angular.module('votifiAngularApp')
.controller 'QuestionsCtrl',
    ['Question', 'Page', '$scope', '$q', '$modal', 'Globals', (Question, Page, $scope, $q, $modal, Globals) ->
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
          controller: 'QuestionModalCtrl'
          resolve:
            question: ->
              question
            pages: ->
              $scope.pages
            messages: ->
              $scope.messages


    ]


angular.module('votifiAngularApp')
.controller 'QuestionModalCtrl',
    ['$scope', '$modalInstance', 'Facebook', 'question', 'pages', 'messages',
      ($scope, $modalInstance, Facebook, question, pages, messages) ->
        $scope.question = question
        $scope.pages = pages
        $scope.messages = messages
        $scope.post =
          qid: $scope.question.qid

        $scope.publish = ->
          Facebook.postLink($scope.post, pages).then (response) ->
            $scope.messages.push({ type: 'success', content: 'Your post was successful!' })
            $scope.cancel()
        $scope.cancel = ->
          $modalInstance.dismiss('cancel')

    ]