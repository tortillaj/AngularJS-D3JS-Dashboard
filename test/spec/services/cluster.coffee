'use strict'

describe 'Service: Cluster', ->

  # load the service's module
  beforeEach module 'votifiAngularApp'

  # instantiate service
  Cluster = {}
  beforeEach inject (_Cluster_) ->
    Cluster = _Cluster_

  it 'should do something', ->
    expect(!!Cluster).toBe true
