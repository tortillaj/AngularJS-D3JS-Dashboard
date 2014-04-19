'use strict'

describe 'Controller: ExportCtrl', ->

  # load the controller's module
  beforeEach module 'votifiAngularApp'

  ExportCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    ExportCtrl = $controller 'ExportCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(scope.awesomeThings.length).toBe 3
