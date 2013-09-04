path   = require 'path'
yeoman = require 'yeoman-generator'

class WebappAberigleGenerator extends yeoman.generators.Base

  constructor: (args, options, config) ->
    super

    @on 'end', ->
      @installDependencies skipInstall: options['skip-install']
      return

    @pkg = JSON.parse(@readFileAsString(path.join(__dirname, '../package.json')))
    return

  askFor: -> 
    cb = do @async

    # have Yeoman greet the user.
    console.log @yeoman
    
    prompts = [
      type    : 'confirm'
      name    : 'someOption'
      message : 'Would you like to enable this option?'
      default : true
    ]

    @prompt prompts, (props) =>
      @someOption = props.someOption
      do cb
      return

    return

  app : ->
    @mkdir 'app'    

    @copy '_package.json', 'package.json'
    @copy '_bower.json', 'bower.json'
    return


  projectfiles : -> 
    this.copy('editorconfig', '.editorconfig');
    this.copy('jshintrc', '.jshintrc');
    return

module.exports = WebappAberigleGenerator

