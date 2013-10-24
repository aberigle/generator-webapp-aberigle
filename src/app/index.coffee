path   = require 'path'
yeoman = require 'yeoman-generator'

class WebappAberigleGenerator extends yeoman.generators.Base

  constructor: (args, options, config) ->
    super

    @on 'end', ->
      @installDependencies skipInstall: options['skip-install']
      return
 
    @pkg = JSON.parse @readFileAsString(path.join(__dirname, '../package.json'))
    return

  askFor: -> 
    # cb = do @async

    # # have Yeoman greet the user.
    console.log @yeoman 
    
    # prompts = [
    #   type    : 'confirm'
    #   name    : 'someOption'
    #   message : 'Would you like to enable this option?'
    #   default : true
    # ]

    # @prompt prompts, (props) =>
    #   @someOption = props.someOption
    #   do cb
    #   return

    return

  gruntfile: ->
    @copy 'gruntfile.coffee', 'gruntfile.coffee'
    return

  app : -> 
    @mkdir 'app'
    @mkdir 'src'
    @mkdir 'src/coffee'
    @mkdir 'src/stylus'
    @mkdir 'src/jade'

    @copy 'coffee/app.coffee' , 'src/coffee/app.coffee'
    @copy 'stylus/app.styl'   , 'src/stylus/app.styl'
    @copy 'jade/app.jade' , 'src/jade/app.jade'

    @copy 'gitignore', '.gitignore'
    @copy 'bowerrc', '.bowerrc'
    @copy '_package.json', 'package.json'
    @copy '_bower.json', 'bower.json'
    return


  projectfiles : -> 
    
    @copy 'editorconfig', '.editorconfig'
    @copy 'jshintrc', '.jshintrc'
    return

module.exports = WebappAberigleGenerator

