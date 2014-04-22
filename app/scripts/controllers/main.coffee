'use strict'

angular.module('votifiAngularApp')
  .controller 'MainCtrl', ['Question', 'Node', 'Cluster', '$scope', '$timeout', (Question, Node, Cluster, $scope, $interval) ->

    ##
    #
    # Questions
    #
    ##
    $scope.questionData = Question.getQuestions()

    $scope.formatDateAsDayName = ->
      (d) ->
        format = d3.time.format('%A')
        format(new Date(d * 1000))

    $scope.$on 'elementClick.directive', (angularEvent, event) ->
      console.dir event

    $scope.questionToolTipContent = ->
      (key, x, y, e, graph) ->
        '<p>' + key + ': ' + y + '</p>'

    #$interval (->
    #  $scope.width = 200
    #  $scope.height = 100
    #  for i in [0...$scope.questionData[0].lastWeek.datas[0].values.length]
    #    $scope.questionData[0].lastWeek.datas[0].values[i][1] = 1.2 * $scope.questionData[0].lastWeek.datas[0].values[i][1]
    #  $scope.$apply()
    #  return
    #), 3000

    ##
    #
    # Nodes
    #
    ##
    $scope.nodeData = Node.getNodes()
    $scope.trendingNodes = $scope.nodeData[0]

    $scope.nodeToolTipContent = ->
      (key, x, y, e, graph) ->
        split = e.point[0].split '|'
        '<p>' + split[1] + '</p>'

    $scope.nodeXAxisContent = ->
      (d) ->
        label = d.split '|'
        label[0]

    ##
    #
    # Clusters
    #
    ##
    $scope.clusterData = Cluster.getClusters()
    console.dir $scope.clusterData

    return

  ]