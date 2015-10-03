/**
 * (c) 2015 Ruben Schmidmeister. <ruby@fog.im>
 */

'use strict';

var gulp = require('gulp'),
    sass = require('gulp-sass'),
    autoprefixer = require('autoprefixer'),
    postcss = require('gulp-postcss');


gulp.task('build', function () {
    gulp.src('sass/style.scss')
        .pipe(sass())
        .on('error', console.log)
        .pipe(postcss([autoprefixer({ cascade: false })]))
        .pipe(gulp.dest('css/'));
});

gulp.task('watch', function(){
   gulp.watch('sass/**/*.scss', ['build']);
});