module.exports = (grunt) ->

  grunt.initConfig {
    compass:
      docs:
        options:
          sassDir: "sass"
          cssDir: "docs/assets/css"
          environment: "production"
      dev:
        options:
          sassDir: "sass"
          cssDir: "."
          specify: "sass/aegis.scss"
          outputStyle: "expanded"
          debugInfo: false

    cssmin:
      aegis:
        cwd: '.'
        src: 'aegis.css'
        dest: 'aegis.min.css'
        options:
          banner: "/* Aegis. Build #{new Date()} */"

    jade:
      docs:
        options:
          client: false
          pretty: true
        files: [
          expand: true
          flatten: true
          cwd: 'templates'
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
        tasks: ['compass:dev']
        options:
          nospawn: true
      docs:
        files: ['templates/**/*.jade', 'sass/*.scss']
        tasks: ['jade:docs','compass:docs']
        options:
          nospawn: true
  }


  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-compass'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-jade'
  grunt.loadNpmTasks 'grunt-contrib-cssmin'

  grunt.registerTask 'default', ['watch:css']

  grunt.registerTask 'build', ['clean', 'compass', 'cssmin', 'jade:docs', 'coffee:plugins', 'coffee:test']
