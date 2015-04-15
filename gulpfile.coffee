gulp = require 'gulp'

jade = require 'gulp-react-jade'
babel = require 'gulp-babel'
rename = require 'gulp-rename'
watchify = require 'gulp-watchify'
replace = require 'gulp-replace'

gulp.task 'build:babel', ->
  gulp.src('src/**/*.js')
    .pipe(babel())
    .pipe(gulp.dest('lib'))

gulp.task 'build:jade', ->
  gulp.src('src/**/*.jade')
    .pipe jade()
    .pipe replace('typeof React !== "undefined" ? React : require("react")', 'React')
    .pipe(gulp.dest('lib'))

watching = false
gulp.task 'enable-watch-mode', -> watching = true
gulp.task 'browserify', watchify (watchify) ->
  gulp.src 'lib/index.js'
    .pipe watchify
      watch: watching
    .pipe rename('index.ios.js')
    .pipe gulp.dest 'HelloNative/'

gulp.task 'watchify', ['enable-watch-mode', 'browserify']

gulp.task 'build', [
  'build:babel'
  'build:jade'
  'browserify'
]

gulp.task 'watch', ['build', 'enable-watch-mode', 'watchify'], ->
  gulp.watch 'src/**/*.js', ['build:babel']
  gulp.watch 'src/**/*.jade', ['build:jade']
  gulp.watch 'lib/**/*.js', ['browserify']

gulp.task 'default', ['build']
