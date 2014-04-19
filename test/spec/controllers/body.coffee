'use strict'

describe 'Controller: BodyCtrl', ->

  # load the controller's module
  beforeEach module 'votifiAngularApp'

  BodyCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    BodyCtrl = $controller 'BodyCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(scope.awesomeThings.length).toBe 3
