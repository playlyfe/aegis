module.exports = (grunt) ->

  # read the config options from bower.json file
  opts = grunt.file.readJSON 'bower.json', encoding: 'utf8'

  grunt.initConfig {

    compass:
      dist:
        options:
          sassDir: "sass"
          cssDir: "."
          specify: "sass/aegis.scss"
          environment: "production"
          outputStyle: "expanded"
          debugInfo: false
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
          banner: "/* Aegis v#{opts.version}. Build #{new Date()} */"

    clean:
      css: ['aegis.css', 'aegis.min.css']

    watch:
      css:
        files: ['sass/*.scss']
        tasks: ['compass:dev']
        options:
          nospawn: true
  }


  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-contrib-compass'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-cssmin'

  grunt.registerTask 'default', ['watch:css']
  grunt.registerTask 'build', ['clean', 'compass:dist', 'cssmin']
