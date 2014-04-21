'use strict'

angular.module('votifiAngularApp')
  .provider 'Modernizr', [->

    # Make the global Modernizr injectable
    # to access it that way rather than using the global object
    @$get = ->
      Modernizr || {}
    return
  ]
