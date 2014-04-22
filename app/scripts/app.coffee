'use strict'

angular
  .module('votifiAngularApp', [
    'ngCookies',
    'ngResource',
    'ngSanitize',
    'ngRoute',
    'ngAnimate',
    'nvd3ChartDirectives',
    'ui.bootstrap',
    'jmdobry.angular-cache'
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
    '$http',
    '$angularCacheFactory',
    ($rootScope, $document, $http, $angularCacheFactory) ->

      $angularCacheFactory 'appCache',
        maxAge: 1000 * 60 * 60 * 24
        cacheFlushInterval: 1000 * 60 * 60 * 24
        storageMode: 'localStorage'
        verifyIntegrity: true
        deleteOnExpire: 'aggressive'

      $http.defaults.cache = $angularCacheFactory.get('cache');
  ]