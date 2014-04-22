'use strict'

angular
  .module('votifiAngularApp', [
    'ngCookies',
    'ngResource',
    'ngSanitize',
    'ngRoute',
    'ngAnimate',
    'nvd3ChartDirectives',
    'ui.bootstrap'
  ])
  .constant 'Globals',
    apiPrefix: '/api'
    colorBrewer: 'YlOrRd'

  .config ($routeProvider) ->
    $routeProvider
      .when '/',
        templateUrl: 'views/main.html'
        controller: 'MainCtrl'
      .when '/clusters',
        templateUrl: 'views/clusters.html'
        controller: 'ClustersCtrl'
      .when '/nodes',
        templateUrl: 'views/nodes.html'
        controller: 'NodesCtrl'
      .when '/questions',
        templateUrl: 'views/questions.html'
        controller: 'QuestionsCtrl'
      .when '/export',
        templateUrl: 'views/export.html'
        controller: 'ExportCtrl'
      .otherwise
        redirectTo: '/'

  .run [
    '$rootScope',
    '$document',
    ($rootScope, $document) ->

  ]