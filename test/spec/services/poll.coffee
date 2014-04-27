'use strict'

describe 'Service: Poll', ->

  # load the service's module
  beforeEach module 'votifiAngularApp'

  # instantiate service
  Poll = {}
  beforeEach inject (_Poll_) ->
    Poll = _Poll_

  it 'should do something', ->
    expect(!!Poll).toBe true
