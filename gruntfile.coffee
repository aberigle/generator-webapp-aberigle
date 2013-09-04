module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON "package.json"

    src:
      app : [
        "src/app/*.coffee"]
      test : [
        "src/test/*.coffee"]

    concat_src :
      app  : ".tmp/app.coffee"
      test : ".tmp/test.coffee"

    concat : 
      app :
        src  : "<%=src.app%>"
        dest : "<%=concat_src.app%>"
      test :
        src  : "<%=src.test%>"
        dest : "<%=concat_src.test%>"

    coffee :
      app :
        files:
          "app/index.js" : "<%=concat_src.app%>"
      test:
        files:
          "test/test.js" : "<%=concat_src.test%>"

    watch : 
      main : 
        files : ["<%=src.app%>","<%=src.test%>"]
        tasks : ["concat", "coffee"]

  grunt.loadNpmTasks "grunt-contrib-coffee"
  grunt.loadNpmTasks "grunt-contrib-concat"
  grunt.loadNpmTasks "grunt-contrib-watch"

  grunt.registerTask "default", ["concat", "coffee"]
