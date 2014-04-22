'use strict'

describe 'Service: Colorbrewer', ->

  # load the service's module
  beforeEach module 'votifiAngularApp'

  # instantiate service
  Colorbrewer = {}
  beforeEach inject (_Colorbrewer_) ->
    Colorbrewer = _Colorbrewer_

  it 'should do something', ->
    expect(!!Colorbrewer).toBe true
