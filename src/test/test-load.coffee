assert = require 'assert'

describe 'webapp-aberigle generator', ->
  it 'can be imported without blowing up', ->
    app = require '../app'
    assert app isnt undefined 