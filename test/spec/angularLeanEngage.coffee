'use strict'

describe 'Service: angularLeanEngage', ->

  beforeEach module 'angularLeanEngage'

  angularLeanEngage = {}
  beforeEach inject (_angularLeanEngage_) ->
    angularLeanEngage = _angularLeanEngage_

  it 'should do something', ->
    expect(!!angularLeanEngage).toBe true
