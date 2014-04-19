'use strict'

describe 'Controller: QuestionsCtrl', ->

  # load the controller's module
  beforeEach module 'votifiAngularApp'

  QuestionsCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    QuestionsCtrl = $controller 'QuestionsCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(scope.awesomeThings.length).toBe 3
