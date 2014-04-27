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
          messages: ->
            $scope.messages


  ]


QuestionModalCtrl = ($scope, $modalInstance, Facebook, DiscourseAnalytics, question, pages, messages) ->
  $scope.question = question
  $scope.pages = pages
  $scope.messages = messages

  $scope.post =
    qid: $scope.question.qid
  $scope.publish = ->
    Facebook.postLink($scope.post, pages).then (response) ->
      console.dir response
      #DiscourseAnalytics.createFacebookPost(
      #  poll_id: $scope.post.qid
      #  fb_page_id: $scope.post.fbPageId
      #  fb_post_id: response.id
      #).then () ->
      #  $scope.cancel()
      $scope.messages.push({ type: 'success', content: 'Your post was successful!' })
      $scope.cancel()
  $scope.cancel = ->
    $modalInstance.dismiss('cancel')