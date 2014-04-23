'use strict'

angular.module('votifiAngularApp')
  .controller 'NodesCtrl', ['Node', '$scope', 'Globals', (Node, $scope, Globals) ->

    _chunk = (a,s) ->
      if a.length is 0
        []
      else
        ( a[i..i+s-1] for i in [0..a.length - 1 ] by s)

    Node.getNodes().then (data) ->
      $scope.rows = _chunk data.nodes, 2

    $scope.nodeToolTipContent = ->
      (key, x, y, e, graph) ->
        '<p>' + e.point[0] + '</p>'

    $scope.nodeValueFormat = ->
      (d) ->
        d3.round(d)

  ]
