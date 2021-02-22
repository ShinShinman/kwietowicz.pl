const gulp  = require('gulp')
const postcss = require('gulp-postcss')
const autoprefixer = require('autoprefixer')
const cssImport = require('postcss-import')
const simpleVars = require('postcss-simple-vars')
const nested = require('postcss-nested')
const cssnano = require('cssnano')
const rename = require('gulp-rename')
const babel = require('gulp-babel')
const sourcemaps = require('gulp-sourcemaps')
const terser = require('gulp-terser')
const browserSync = require('browser-sync').create()
const relpace = require('gulp-replace');

const packageInfo = require('./package.json');

styles = (cb) => {
  return gulp.src('assets/postcss/main.pcss')
    .pipe(sourcemaps.init())
    .pipe(postcss([cssImport, simpleVars, nested, autoprefixer, cssnano]))
    .pipe(rename({
      suffix: '.min',
      extname: '.css'
    }))
    .pipe(sourcemaps.write())
    .pipe(gulp.dest('css'))
}

scripts = () => {
  return gulp.src('assets/babel/*.js')
    .pipe(sourcemaps.init())
    .pipe(babel({
      presets: ['@babel/preset-env']
    }))
    .pipe(terser())
    .pipe(rename('main.min.js'))
    .pipe(sourcemaps.write())
    .pipe(gulp.dest('js'))
    .pipe(browserSync.stream())
}

// var cbString = new Date().getTime().toString().slice(-6);
var cbString = packageInfo.version;
function cacheBust() {
	console.log('%cAktualna wersja: ' + cbString + ', ' + packageInfo.description, 'color: lightpink')
	return gulp.src('./utilities/master.xsl')
		.pipe(relpace(/v=(\d+\.*)+/g, 'v=' + cbString))
		.pipe(gulp.dest('./utilities'))
}

bs = () => {
  browserSync.init({
    proxy: 'kwietowicz.local'
  })
}

watchFiles = () => {
	bs();
	gulp.watch(['assets/postcss/**/*.pcss'],
		gulp.series(styles, function reloading(done) {
			browserSync.reload();
			done();
		})
	);
	gulp.watch(['assets/babel/**/*.js'],
		gulp.series(scripts)
	);
	gulp.watch(['pages/*.xsl', 'utilities/*.xsl'],
		function reloading(done) {
			browserSync.reload();
			done();
		}
	);
  gulp.watch(['package.json'],
    gulp.series(cacheBust, function reloading(done) {
      browserSync.reload()
      done()
    })
  )
}

exports.cacheBust = cacheBust;
exports.scripts = scripts
exports.default = gulp.series(
  gulp.parallel(styles, scripts), //, cacheBust
  watchFiles
)
