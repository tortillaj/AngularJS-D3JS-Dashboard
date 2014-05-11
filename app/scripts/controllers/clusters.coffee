'use strict'

angular.module('votifiAngularApp')
  .controller 'ClustersCtrl', ['Cluster', 'Globals', '$scope', (Cluster, Globals, $scope) ->
    Cluster.getClusters().then (data) ->
      $scope.clusterData = data
      $scope.overview = data.overview
      $scope.clusters = data.clusters.datas


    $scope.pieX = ->
      (d) ->
        d.key

    $scope.pieY = ->
      (d) ->
        d.y

    $scope.yFunction = ->
      (d) ->
        d[1] - 5

    $scope.valueFormatFunction = () ->
      (d) ->
        format = d3.format ',.2f'
        format d + 5

    $scope.clusterToolTipContent = () ->
      (key, x, y, e, graph) ->
        p = x / $scope.clusterData.total * 100
        '<p>' + key + ': ' + d3.round(p, 1) + '%</p>'

    $scope.nodeToolTipContent = () ->
      (key, x, y, e, graph) ->
        '<p>' + x + ': ' + y + '</p>'

  ]
