module.exports = (grunt) ->

  grunt.initConfig {
    compass:
      prod:
        options:
          sassDir: "sass"
          cssDir: ["docs/assets/css", "."]
          specify: "sass/aegis.scss"
          environment: "production"
      docs:
        options:
          sassDir: "sass"
          cssDir: "docs/assets/css"
          specify: "sass/docs.scss"
      dev:
        options:
          sassDir: "sass"
          cssDir: "docs/assets/css"
          specify: [
            "sass/aegis.scss"
            "sass/docs.scss"
          ]
          outputStyle: "expanded"

    jade:
      docs:
        options:
          client: false
          pretty: true
        files: [
          expand: true
          flatten: true
          cwd: 'docs/pages'
          src: ['**/*.jade', '!**/layout*.jade']
          dest: 'docs/'
          ext: '.html'
        ]

    coffee:
      test:
        expand: true
        flatten: true
        cwd: 'plugins/test'
        src: ['src/*.coffee']
        dest: 'plugins/test/spec/'
        ext: '.spec.js'
      plugins:
        expand: true
        flatten: true
        cwd: 'plugins/src'
        src: ['*.coffee']
        dest: 'docs/assets/js/'
        ext: '.js'
        options:
          bare: true

    clean:
      plugins: ['docs/assets/js/*.js']
      css: ['docs/assets/css/aegis.css', 'docs/assets/css/docs.css']
      tests: ['plugins/test/spec']

    watch:
      tests:
        files: ['plugins/**/*.coffee']
        tasks: ['coffee:test', 'coffee:plugins']
        options:
          nospawn: true
      css:
        files: ['sass/*.scss']
        tasks: ['compass:prod','compass:docs']
        options:
          nospawn: true
      docs:
        files: ['docs/pages/**/*.jade']
        tasks: ['jade:docs']
        options:
          nospawn: true
  }


  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-compass'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-jade'

  grunt.registerTask 'default', ['compass:prod', 'compass:docs', 'jade:docs', 'coffee:plugins', 'coffee:test']

  grunt.registerTask 'css', ['compass:prod', 'compass:docs']
  grunt.registerTask 'docs', ['jade:docs']

  grunt.registerTask 'plugins-test', ['coffee:test']
  grunt.registerTask 'plugins', ['coffee:plugins']

  grunt.registerTask 'build', ['clean', 'css', 'docs', 'plugins-test', 'plugins']
