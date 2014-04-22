'use strict'

angular.module('votifiAngularApp')
  .controller 'MainCtrl', ['Question', 'Node', 'Cluster', 'Colorbrewer', '$scope', 'Globals', (Question, Node, Cluster, Colorbrewer, $scope, Globals) ->

    ##
    #
    # Questions
    #
    ##
    Question.getQuestions().then((data) -> $scope.questionData = data)

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

    $scope.nodeValueFormat = ->
      (d) ->
        d3.round(d)

    ##
    #
    # Clusters
    #
    ##
    $scope.clusterData = Cluster.getClusters()
    $scope.clusters = $scope.clusterData[0].datas

    $scope.xFunction = ->
      (d) ->
        d.key

    $scope.yFunction = ->
      (d) ->
        d.y

    $scope.clusterToolTipContent = () ->
      (key, x, y, e, graph) ->
        p =  x / $scope.clusterData[0].total * 100
        '<p>' + key + ': ' + d3.round(p,1) + '%</p>'

    ##
    #
    # General
    #
    ##
    $scope.colorPalette = (data) ->
      (d, i) ->
        cb = Colorbrewer[Globals.colorBrewer]
        palette = (if (data.length < 9) then cb[data.length] else cb[9])
        if data.length < 3 then palette = cb[3]
        palette[i]



    return

  ]