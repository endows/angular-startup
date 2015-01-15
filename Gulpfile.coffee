gulp = require("gulp")
jade = require("gulp-jade")
webserver = require("gulp-webserver")
concat = require("gulp-concat")
coffee = require("gulp-coffee")
styl = require("gulp-stylus")
gulpif = require("gulp-if")
plumber = require("gulp-plumber")
bower = require("main-bower-files")
karma = require('karma')

gulp.task 'karma:run',(done)->
  karma.server.start
    configFile: __dirname + '/karma.conf.coffee'
    singleRun: true
  ,->
    done()

gulp.task "bower", ->
  gulp.src(bower()).pipe(gulpif(/[.]js$/, concat("lib.js"))).pipe(gulpif(/[.]css$/, concat("lib.css"))).pipe gulp.dest("public/")
  return

gulp.task "jade", ->
  gulp.src("jade/**/*.jade").pipe(plumber()).pipe(jade()).pipe gulp.dest("public/")

gulp.task "coffee", ->
  gulp.src(["coffee/**/*.coffee"]).pipe(plumber()).pipe(gulpif(/[.]coffee$/, coffee())).pipe(concat("all.js")).pipe gulp.dest("public/")

gulp.task "styl", ->
  gulp.src(["styl/**/*.styl"]).pipe(plumber()).pipe(styl()).pipe(concat("all.css")).pipe gulp.dest("public/")

gulp.task "webserver", ->
  gulp.src("public").pipe webserver(livereload: true)
  return

gulp.task "default", [
  "jade"
  "coffee"
  "bower"
  "webserver"
], ->
  gulp.watch "jade/*.jade", ["jade"]
  gulp.watch "styl/*.styl", ["styl"]
  gulp.watch "coffee/*.coffee", ["coffee"]
  gulp.watch "lib/*", [
    "styl"
    "coffee"
  ]
  gulp.watch "bower_components/*", ["bower"]
