'use strict'

angular.module('votifiAngularApp')
  .controller 'ClustersCtrl', ['Cluster', 'Globals', '$scope', (Cluster, Globals, $scope) ->
    Cluster.getClusters().then (data) ->
      $scope.clusterData = data
      $scope.overview = data.overview
      $scope.clusters = data.clusters.datas


    $scope.xFunction = ->
      (d) ->
        d.key

    $scope.yFunction = ->
      (d) ->
        d.y

    $scope.clusterToolTipContent = () ->
      (key, x, y, e, graph) ->
        p = x / $scope.clusterData.total * 100
        '<p>' + key + ': ' + d3.round(p, 1) + '%</p>'

    $scope.nodeToolTipContent = () ->
      (key, x, y, e, graph) ->
        '<p>' + x + ': ' + y + '</p>'

  ]
