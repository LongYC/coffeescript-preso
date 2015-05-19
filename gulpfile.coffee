packagejson = require './package.json'

gulp = require 'gulp'
jade = require 'gulp-jade'
coffee = require 'gulp-coffee'
less = require 'gulp-less'
minify = require 'gulp-minify-css'
uglify = require 'gulp-uglify'

# Distribution directories.

distDir = 'dist'
distCssDir = "#{distDir}/css"
distJsDir = "#{distDir}/js"
distExampleDir = "#{distDir}/example"

# Copy dependencies.

gulp.task 'uglify', ->
  gulp.src [
    'bower_components/impress.js/js/impress.js'
    'assets/vendor/prism/prism.js'
  ]
    .pipe uglify()
    .pipe gulp.dest distJsDir

gulp.task 'minify', ->
  gulp.src 'assets/vendor/prism/prism.css'
    .pipe minify()
    .pipe gulp.dest distCssDir

gulp.task 'favicon', ->
  gulp.src 'assets/favicon.ico'
    .pipe gulp.dest distDir

gulp.task 'copy', ['uglify', 'minify', 'favicon']

# Prepare examples.

gulp.task 'source', ->
  gulp.src 'src/coffee/example/*.coffee'
    .pipe gulp.dest distExampleDir

gulp.task 'output', ->
  gulp.src 'src/coffee/example/*.coffee'
    .pipe coffee()
    .pipe gulp.dest distExampleDir

gulp.task 'example', ['source', 'output']

# Compile source.

gulp.task 'jade', ->
  gulp.src 'src/jade/index.jade'
    .pipe jade
      locals:
        version: packagejson.version
    .pipe gulp.dest distDir

gulp.task 'less', ->
  gulp.src 'src/less/main.less'
    .pipe less()
    .pipe minify()
    .pipe gulp.dest distCssDir

gulp.task 'coffee', ->
  gulp.src 'src/coffee/main.coffee'
    .pipe coffee()
    .pipe uglify()
    .pipe gulp.dest distJsDir

gulp.task 'compile', ['jade', 'less', 'coffee']

# Default.

gulp.task 'default', ['copy', 'example', 'compile']