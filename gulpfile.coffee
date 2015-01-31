gulp = require 'gulp'
jade = require 'gulp-jade'
coffee = require 'gulp-coffee'
less = require 'gulp-less'
uglify = require 'gulp-uglify'

# Compile.

gulp.task 'jade', ->
  gulp.src 'src/jade/*.jade'
    .pipe jade()
    .pipe gulp.dest 'dist'

gulp.task 'less', ->
  gulp.src 'src/less/*.less'
    .pipe less()
    .pipe gulp.dest 'dist/css'

gulp.task 'coffee', ->
  gulp.src 'src/coffee/*.coffee'
    .pipe coffee()
    .pipe gulp.dest 'dist/js'

gulp.task 'compile', ['jade', 'less', 'coffee']

# Copy dependency.

gulp.task 'uglify', ->
  gulp.src 'bower_components/impress.js/js/impress.js'
    .pipe uglify()
    .pipe gulp.dest 'dist/js'

# Default.

gulp.task 'default', ['compile', 'uglify']