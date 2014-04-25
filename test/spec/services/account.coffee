'use strict'

describe 'Service: Account', ->

  # load the service's module
  beforeEach module 'votifiAngularApp'

  # instantiate service
  Account = {}
  beforeEach inject (_Account_) ->
    Account = _Account_

  it 'should do something', ->
    expect(!!Account).toBe true
