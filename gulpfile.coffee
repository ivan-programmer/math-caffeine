### Gulp File by Ivan Vinogradov for do-math project ###

gulp = require 'gulp'
stylus = require 'gulp-stylus'
coffee = require 'gulp-coffee'
mincss = require 'gulp-csso'
minjs = require 'gulp-uglify'
rename = require 'gulp-rename'

gulp.task 'minjs', ->
  gulp.src './public/script.js'

    .pipe minjs()
    .on 'error', (err) ->
      console.error '\n\n\n*** JS Compress Error occurred *** \n\n\n'
      console.log err
      console.error '\n\n\n*** JS Compress Error backtrace ended *** \n\n\n'

    .pipe rename (file) ->
      file.basename += '.min'

    .pipe gulp.dest './public'
    console.log "----===**  Compressing JS file  **===----"

gulp.task 'mincss', ->
  gulp.src './public/stylesheet.css'

  .pipe mincss()
  .on 'error', (err) ->
    console.error '\n\n\n*** CSS Compress Error occurred *** \n\n\n'
    console.log err
    console.error '\n\n\n*** CSS Compress Error backtrace ended *** \n\n\n'

  .pipe rename (file) ->
    file.basename += '.min'

  .pipe gulp.dest './public'
  console.log "----===**  Compressing CSS file  **===----"

gulp.task 'coffee', ->
  gulp.src './source/script.coffee'

    .pipe coffee()
    .on 'error', (err) ->
      console.error '\n\n*** COFFEE Compile Error occurred *** \n\n'
      console.log err
      console.error '\n\n*** COFFEE Compile Error backtrace ended *** \n\n'

    .pipe gulp.dest './public'
    console.log "----===**  Compiling COFFEE file  **===----"
    gulp.start 'minjs'

gulp.task 'stylus', ->
  gulp.src './source/stylesheet.styl'

    .pipe stylus()
    .on 'error', (err) ->
      console.error '\n\n\n*** STYLUS Compile Error occurred *** \n\n\n'
      console.log err
      console.error '\n\n\n*** STYLUS Compile Error backtrace ended *** \n\n\n'

    .pipe gulp.dest './public'
    console.log "----===**  Compiling STYLUS file  **===----"
    gulp.start 'mincss'

gulp.task 'coffee:watch', ->
  gulp.watch './source/script.coffee', ['coffee']
  console.log "----===**  Watching to COFFEE file  **===----"

gulp.task 'stylus:watch', ->
  gulp.watch './source/stylesheet.styl', ['stylus']
  console.log "----===**  Watching to STYLUS file  **===----"

gulp.task 'minjs:watch', ->
  gulp.watch './public/script.js', ['minjs']
  console.log "----===** Watching to JS file **===----"

gulp.task 'mincss:watch', ->
  gulp.watch './public/stylesheet.css', ['mincss']
  console.log "----===** Watching to CSS file **===----"

gulp.task 'watch', ->
  gulp.start 'coffee:watch'
  gulp.start 'stylus:watch'
  console.log "----===**  WATCHING IS STARTED  **===----"

gulp.task 'default', ->
  gulp.start 'watch'
  console.log "----===**  DEFAULT TASK IS STARTED  **===----"
