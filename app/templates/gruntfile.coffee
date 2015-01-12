module.exports = (grunt) ->
  require('load-grunt-tasks')(grunt)
  grunt.initConfig
    pkg: grunt.file.readJSON "package.json"
    meta:
      dest: 'app'
      static : 'app/static'
      banner: """
/*
  <%= pkg.name %> v<%= pkg.version %> - <%= grunt.template.today("d/m/yyyy") %>

  Author: <%= pkg.author.name %> - <%= pkg.author.email %>
*/

      """
    src:
      coffee : [
        "src/coffee/*.coffee"
        "src/coffee/*/*.coffee"]
      stylus : [
        "src/stylus/*.styl"]
      jade : "src/jade/web"
      jade_files : [
        "src/jade/**/*.jade"
      ]

    jade :
      build:
        options:
          data: debug: true
          pretty : false
        files : [
          cwd    : "<%=src.jade%>"
          src    : "**/*.jade"
          dest   : "<%=meta.dest%>"
          expand : true
          ext    : ".html"
        ]

    concat :
      coffee :
        files:
          ".tmp/coffee/tmp.coffee" : "<%=src.coffee%>"

    coffee:
      build:
        files:
          '<%=meta.static%>/js/<%=pkg.name%>.debug.js' :'.tmp/coffee/tmp.coffee'

    stylus:
      tmp:
        options:
          compress: false
        files:
          '<%=meta.static%>/css/<%=pkg.name%>.css' : '<%=src.stylus%>'

    uglify:
      options:
        banner: '<%= meta.banner %>'
      build:
        files:
          '<%=meta.static%>/js/<%=pkg.name%>.js' : [
            '<%=meta.static%>/js/<%=pkg.name%>.debug.js'
          ]

    watch :
      main :
        files : ["gruntfile.coffee"]
        tasks : ["default"]
      coffee :
        files : ["<%=src.coffee%>"]
        tasks : ["concat","coffee", "uglify"]
        options :
          livereload : true
      stylus :
        files : ["<%=src.stylus%>"]
        tasks : ["stylus"]
        options :
          livereload : true
      jade :
        files : ["<%=src.jade%>","<%=src.jade_files%>"]
        tasks : ["jade"]
        options :
          livereload : true

  grunt.registerTask "default", [
    "stylus"
    "concat"
    "coffee"
    "uglify"
    "jade"
  ]
