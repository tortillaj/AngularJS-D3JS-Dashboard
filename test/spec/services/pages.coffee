'use strict'

describe 'Service: Pages', ->

  # load the service's module
  beforeEach module 'votifiAngularApp'

  # instantiate service
  Pages = {}
  beforeEach inject (_Pages_) ->
    Pages = _Pages_

  it 'should do something', ->
    expect(!!Pages).toBe true
