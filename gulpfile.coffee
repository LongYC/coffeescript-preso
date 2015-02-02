gulp = require 'gulp'
jade = require 'gulp-jade'
coffee = require 'gulp-coffee'
less = require 'gulp-less'
minify = require 'gulp-minify-css'
uglify = require 'gulp-uglify'

# Compile source.

gulp.task 'jade', ->
  gulp.src 'src/jade/index.jade'
    .pipe jade()
    .pipe gulp.dest 'dist'

gulp.task 'less', ->
  gulp.src 'src/less/main.less'
    .pipe less()
    .pipe minify()
    .pipe gulp.dest 'dist/css'

gulp.task 'coffee', ->
  gulp.src 'src/coffee/main.coffee'
    .pipe coffee()
    .pipe uglify()
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

# Prepare examples.

gulp.task 'source', ->
  gulp.src 'src/coffee/example/*.coffee'
    .pipe gulp.dest 'dist/example'

gulp.task 'output', ->
  gulp.src 'src/coffee/example/*.coffee'
    .pipe coffee()
    .pipe gulp.dest 'dist/example'

gulp.task 'example', ['source', 'output']

# Default.

gulp.task 'default', ['compile', 'copy', 'example']