'use strict'

describe 'Service: DiscourseAnalytics', () ->

  # load the service's module
  beforeEach module 'votifiAngularApp'

  # instantiate service
  DiscourseAnalytics = {}
  beforeEach inject (_DiscourseAnalytics_) ->
    DiscourseAnalytics = _DiscourseAnalytics_

  it 'should do something', () ->
    expect(!!DiscourseAnalytics).toBe true
