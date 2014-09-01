gulp = require 'gulp'
gutil = require 'gulp-util'
rimraf = require 'gulp-rimraf'
rename = require 'gulp-rename'
plumber = require 'gulp-plumber'
compass = require 'gulp-compass'
minify = require 'gulp-minify-css'
header = require 'gulp-header'
bump = require 'gulp-bump'
watch = require 'gulp-watch'
runSequence = require 'run-sequence'

banner =
  long: """
  /**
   * <%= pkg.name %> - <%= pkg.description %>
   * version: <%= pkg.version %>
   * repository: <%= pkg.homepage %>
   * license: <%= pkg.license %>
   * author: <%= pkg.author.name %> (<%= pkg.author.email %>)
   * build: #{new Date()}
  **/

  """
  short: "/* <%= pkg.name %> v<%= pkg.version %> | build: #{new Date()} */\n"

paths =
  src: 'sass'
  dest: 'dist'

gulp.task 'clean', ->
  gulp.src("#{paths.dest}", {read: false})
    .pipe(rimraf())

gulp.task 'dev', ->
  gulp.src("#{paths.src}/**/*.scss")
    .pipe(plumber({
      errorHandler: (err)->
        gutil.beep()
        console.log err
    }))
    .pipe(compass({
      sass: paths.src
      css: paths.dest
      style: 'expanded'
    }).on('error', gutil.log))

gulp.task 'prod', ['clean'], ->
  pkg = require './package.json'
  gutil.log gutil.colors.black.bgYellow(" Generating Production Build ")
  gulp.src("#{paths.src}/**/*.scss")
    .pipe(plumber({
      errorHandler: (err)->
        gutil.beep()
        console.log err
    }))
    .pipe(compass({
      sass: paths.src
      css: paths.dest
      style: 'expanded'
      environment: 'production'
    }).on('error', gutil.log))
    .pipe(header(banner.long, {pkg: pkg}))
    .pipe(gulp.dest(paths.dest))
    .pipe(minify())
    .pipe(header(banner.short, {pkg: pkg}))
    .pipe(rename('aegis.min.css'))
    .pipe(gulp.dest(paths.dest))

gulp.task 'bump', ->
  gulp.src(['./bower.json', './package.json'])
    .pipe(bump())  # Bump version
    .pipe(gulp.dest './')

gulp.task 'watch', ->
  watch {glob: "#{paths.src}/**/*.scss"}, ['compass']

gulp.task 'default', ['watch']
gulp.task 'publish', ->
  runSequence 'bump', 'prod', ->
    gutil.log gutil.colors.black.bgCyan(" You can publish to git now ")
