'use strict'

describe 'Controller: ClustersCtrl', ->

  # load the controller's module
  beforeEach module 'votifiAngularApp'

  ClustersCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    ClustersCtrl = $controller 'ClustersCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(scope.awesomeThings.length).toBe 3
