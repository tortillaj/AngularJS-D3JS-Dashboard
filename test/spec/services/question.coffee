'use strict'

describe 'Service: Question', ->

  # load the service's module
  beforeEach module 'votifiAngularApp'

  # instantiate service
  question = {}
  beforeEach inject (_question_) ->
    question = _question_

  it 'should do something', ->
    expect(!!question).toBe true
