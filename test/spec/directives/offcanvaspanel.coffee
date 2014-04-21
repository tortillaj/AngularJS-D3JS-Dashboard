'use strict'

describe 'Directive: offCanvasPanel', ->

  # load the directive's module
  beforeEach module 'votifiAngularApp'

  scope = {}

  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()

  it 'should make hidden element visible', inject ($compile) ->
    element = angular.element '<off-canvas-panel></off-canvas-panel>'
    element = $compile(element) scope
    expect(element.text()).toBe 'this is the offCanvasPanel directive'
