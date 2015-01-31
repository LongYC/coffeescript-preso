gulp = require 'gulp'
jade = require 'gulp-jade'
coffee = require 'gulp-coffee'
less = require 'gulp-less'
minify = require 'gulp-minify-css'
uglify = require 'gulp-uglify'

# Compile.

gulp.task 'jade', ->
  gulp.src 'src/jade/*.jade'
    .pipe jade()
    .pipe gulp.dest 'dist'

gulp.task 'less', ->
  gulp.src 'src/less/*.less'
    .pipe less()
    .pipe minify()
    .pipe gulp.dest 'dist/css'

gulp.task 'coffee', ->
  gulp.src 'src/coffee/*.coffee'
    .pipe coffee()
    .pipe gulp.dest 'dist/js'

gulp.task 'compile', ['jade', 'less', 'coffee']

# Copy dependencies.

gulp.task 'uglify', ->
  gulp.src [
    'bower_components/impress.js/js/impress.js'
    'vendor/prism/prism.js'
  ]
    .pipe uglify()
    .pipe gulp.dest 'dist/js'

gulp.task 'minify', ->
  gulp.src 'vendor/prism/prism.css'
    .pipe minify()
    .pipe gulp.dest 'dist/css'

gulp.task 'copy', ['uglify', 'minify']

# Default.

gulp.task 'default', ['compile', 'copy']