const mix = require("laravel-mix");
const path = require("path");
let productionSourceMaps = false;
mix.setPublicPath("public/build")
    .setResourceRoot("build")
    .js("resources/js/app.js", "js")
    .vue()
    .sass("resources/sass/app.scss", "css")
    .version()
    .options({
        processCssUrls: false,
    })
    .sourceMaps(productionSourceMaps, "source-map")
    .browserSync({
        proxy: "https://localhost:8088/",
        files: [
            "public/build/css/app.css", // Generated .css file
            "public/build/js/app.js", // Generated .js file
            "app/**/*.+(html|php)", // Generic .html and/or .php files [no specific platform]
            "resources/js/**/*.vue", // Generic .html and/or .php files [no specific platform]
            "resources/js/**/*.js", // Generic .html and/or .php files [no specific platform]
            "resources/sass/**/*.scss", // Generic .html and/or .php files [no specific platform]
            "resources/views/**/*.php", // Laravel-specific view files
        ],
        notify: {
            styles: {
                top: "auto",
                bottom: "0",
            },
        },
        open: false,
    })
    .webpackConfig({
        resolve: {
            alias: {
                "@": path.resolve("resources/sass"),
            },
        },
    });

mix.js('resources/js/main.js', 'js');
