'use strict'

describe 'Controller: AppsCtrl', ->

  # load the controller's module
  beforeEach module 'votifiAngularApp'

  AppsCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    AppsCtrl = $controller 'AppsCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(scope.awesomeThings.length).toBe 3
