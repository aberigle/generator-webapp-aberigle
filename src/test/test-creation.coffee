path    = require 'path'
helpers = require('yeoman-generator').test

describe 'webapp-aberigle generator', ->
  beforeEach (done) ->
    helpers.testDirectory path.join(__dirname, 'temp'), (err) =>
       if err then return done err

       @app = helpers.createGenerator 'webapp-aberigle:app', ['../../app']
       do done
       return 
    return

  it 'creates expected files', (done) ->
    expected = [
      # add files you expect to exist here.
      '.jshintrc',
      '.editorconfig'
    ]

    helpers.mockPrompt @app, 'someOption' : true

    @app.options['skip-install'] = true
    @app.run {}, ->
      helpers.assertFiles expected
      do done
      return
