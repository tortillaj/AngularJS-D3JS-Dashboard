'use strict'

describe 'Controller: NodesCtrl', ->

  # load the controller's module
  beforeEach module 'votifiAngularApp'

  NodesCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    NodesCtrl = $controller 'NodesCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(scope.awesomeThings.length).toBe 3
