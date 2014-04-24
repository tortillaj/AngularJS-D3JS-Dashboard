'use strict'

angular.module('votifiAngularApp')
  .controller 'MainCtrl', ['Question', 'Node', 'Cluster', 'Colorbrewer', '$scope', 'Globals', (Question, Node, Cluster, Colorbrewer, $scope, Globals) ->

    ##
    #
    # Questions
    #
    ##
    $scope.timeScale = 'weekly'

    Question.getQuestions().then (data) ->
      $scope.questionData = data.projects
      $scope.weeklyData = []
      $scope.monthlyData = []
      for k in [0...data.projects.length]
        $scope.weeklyData.push data.projects[k].lastWeek.datas
        $scope.monthlyData.push  data.projects[k].lastMonth.datas
      $scope.chartData = $scope.weeklyData

    $scope.formatDateAsDayName = ->
      (d) ->
        switch $scope.timeScale
          when 'weekly' then format = d3.time.format('%A')
          when 'monthly' then format = d3.time.format('Week of %b %e')
          else format = d3.time.format('%A')
        format(new Date(d * 1000))

    $scope.$on 'elementClick.directive', (angularEvent, event) ->
      d3.selectAll('#project1 .nv-controlsWrap').attr('transform', 'translate(180,180)')

    $scope.questionToolTipContent = ->
      (key, x, y, e, graph) ->
        '<p>' + key + ': ' + y + '</p>'

    $scope.changeTimeFrame = (type) ->
      switch type
        when 'weekly'
          $scope.chartData = $scope.weeklyData
          $scope.timeScale = 'weekly'
        when 'monthly'
          $scope.chartData = $scope.monthlyData
          $scope.timeScale = 'monthly'
        else $scope.chartData = $scope.weeklyData

    $scope.questionYAxisFormat = ->
      (d) ->
        d3.round(d)

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
    $scope.nodeData = Node.getNodes().then (data) ->
      $scope.trendingNodes = data

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



    return

  ]