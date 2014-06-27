var gulp = require('gulp');

var imagemin = require('gulp-imagemin');
var sass = require('gulp-sass');
var minifyCSS = require('gulp-minify-css');
var rename = require('gulp-rename');
var watch = require('gulp-watch');
var concatCSS = require('gulp-concat-css');

var paths = {
  images: {
    src: 'web/assets/img/**/*',
    dest: 'web/assets/img'
  },

  scss: {
    src: [
      'scss/style.scss',
      'bower_components/bootstrap-sass/vendor/assets/stylesheets/bootstrap.scss'
    ],
    dest: 'web/assets/compiled/css',
    finalDest: 'web/assets/css'
  },

  watch: {
    styles: [
      'scss/style.scss',
      'scss/**/*.scss'
    ]
  }
};

/**
 * Stylesheets one time task
 */
gulp.task('styles', function () {
  return gulp.src(paths.scss.src).pipe(sass())
    .pipe(gulp.dest(paths.scss.dest))
    .pipe(concatCSS("styles.css"))
    .pipe(gulp.dest(paths.scss.finalDest))
    .pipe(rename({suffix: '.min'}))
    .pipe(minifyCSS())
    .pipe(gulp.dest(paths.scss.finalDest));
});

/**
 * Watch JS
 */
gulp.task('watch', function () {
  gulp.watch(paths.watch.styles, ['styles']);
});

/**
 * Imagemin task
 */
gulp.task('images', function () {
  return gulp.src(paths.images.src)
    // Pass in options to the task
    .pipe(imagemin({optimizationLevel: 5}))
    .pipe(gulp.dest(paths.images.dest));
});


gulp.task('default', ['watch']);

gulp.task('prod', ['styles']);