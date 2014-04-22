'use strict'

describe 'Service: Node', ->

  # load the service's module
  beforeEach module 'votifiAngularApp'

  # instantiate service
  Node = {}
  beforeEach inject (_Node_) ->
    Node = _Node_

  it 'should do something', ->
    expect(!!Node).toBe true
