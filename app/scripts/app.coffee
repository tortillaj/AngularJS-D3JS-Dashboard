'use strict'

angular
  .module('votifiAngularApp', [
    'templates-server',
    'ngCookies',
    'ngResource',
    'ngSanitize',
    'ngRoute',
    'ngAnimate',
    'nvd3ChartDirectives',
    'ui.bootstrap',
    'jmdobry.angular-cache',
    'ezfb'
  ])
  .constant 'Globals',
    apiPrefix: '/api'
    colorBrewer: 'YlOrRd'
    fbPermissions: 'user_likes,manage_pages,read_stream,publish_actions,offline_access,status_update,user_photos,read_insights'
    fbOffline: true
    fbAppId: 390264891089891

  .config ($routeProvider, ezfbProvider, Globals) ->
    $routeProvider
      .when '/',
        templateUrl: 'views/main.html'
        controller: 'MainCtrl'
        title: 'Overview'
        subtitle: 'Your Analytics Summary'
      .when '/clusters',
        templateUrl: 'views/clusters.html'
        controller: 'ClustersCtrl'
        title: 'Clusters'
        subtitle: 'View Clusters of Users'
      .when '/nodes',
        templateUrl: 'views/nodes.html'
        controller: 'NodesCtrl'
        title: 'Categories'
        subtitle: 'View your Popular Categories'
      .when '/questions',
        templateUrl: 'views/questions.html'
        controller: 'QuestionsCtrl'
        title: 'Pages'
        subtitle: 'Post Your Pages to Facebook'
      .when '/export',
        templateUrl: 'views/export.html'
        controller: 'ExportCtrl'
        title: 'Export'
        subtitle: 'Export Your Data'
      .when '/apps',
        templateUrl: 'views/apps.html'
        controller: 'AppsCtrl'
        title: 'Facebook Pages'
        subtitle: 'Configure Your Facebook Pages'
      .when '/settings',
        templateUrl: 'views/settings.html'
        controller: 'SettingsCtrl'
        title: 'Site Settings'
        subtitle: 'Edit Site Settings'
      .otherwise
        redirectTo: '/'

    ezfbProvider.setInitParams
      appId: Globals.fbAppId

    return

  .run [
    '$rootScope',
    '$document',
    '$http',
    '$angularCacheFactory',
    ($rootScope, $document, $http, $angularCacheFactory) ->

      # setup the default cache settings
      $angularCacheFactory 'defaultCache',
        maxAge: 900000,
        cacheFlushInterval: 6000000
        deleteOnExpire: 'aggressive'
        storageMode: 'localStorage'

      $http.defaults.cache = $angularCacheFactory.get 'defaultCache'

      $rootScope.$on '$routeChangeSuccess', (event, current, previous) ->
        $rootScope.title = current.$$route.title
        $rootScope.subtitle = current.$$route.subtitle

      $rootScope.$on '$viewContentLoaded', (event) ->
        # apply any polyfills needed
        if webshims
          jQuery('main').updatePolyfill()

      $rootScope.$on 'fb.login', (event, response) ->
        #window.location.reload()
  ]

angular.module('votifiAngularApp').filter 'nospace', ->
  (value) ->
    (if (not value) then "" else value.replace(/[^a-zA-Z0-9]/g, ""))

angular.module('votifiAngularApp').filter 'thousandsToK', ->
  (value) ->
    0 if not value
    if value < 1000
      value
    else
      (value / 1000).toFixed(value % 1000 != 0) + 'k'