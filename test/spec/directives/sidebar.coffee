'use strict'

describe 'Directive: sidebar', ->

  # load the directive's module
  beforeEach module 'votifiAngularApp'

  scope = {}

  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()

  it 'should make hidden element visible', inject ($compile) ->
    element = angular.element '<sidebar></sidebar>'
    element = $compile(element) scope
    expect(element.text()).toBe 'this is the sidebar directive'
