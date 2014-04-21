'use strict'

describe 'Service: Modernizr', ->

  # load the service's module
  beforeEach module 'votifiAngularApp'

  # instantiate service
  Modernizr = {}
  beforeEach inject (_Modernizr_) ->
    Modernizr = _Modernizr_

  it 'should do something', ->
    expect(!!Modernizr).toBe true
