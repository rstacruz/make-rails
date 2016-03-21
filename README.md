# make-rails

> Build your Rails assets with anything

make-rails allows you to plug in anything to build your assets, whether that be Node.js tools ([node-sass][], [webpack][], et al) or anything else.

[webpack]: https://webpack.github.io/
[node-sass]: https://github.com/sass/node-sass

## Usage

Add this to your Gemfile. make-rails will register itself as a Sprockets transformation step.

##### Gemfile

```rb
gem 'make-rails'
```

### Create your assets

Create your `.css` and `.js` assets with a `@make:` comment. `make-rails` will pick this up and run it as a transformation for your file. Use `%s` as a placeholder for the current filename.

The command it executes should print its output to STDOUT.

##### app/assets/stylesheets/app.css

```css
/* @make: sassc -I ../../../node_modules %s | postcss -u autoprefixer */

@import 'normalize/normalize.css';

div {
  color: blue;
}
```

## Examples

### Browserify

An example `app/assets/javascripts/application.js` with [Babel][] support:

```js
// @make: browserify %s -t babelify

import $ from 'jquery'

$(function () {
  alert('It works!')
})
```

### Stylus

An example `app/assets/stylesheets/application.css` with [Stylus][] and [postcss][] support:

```js
// @make: stylus --compress %s --include-css | postcss -u rucksack
```

[Babel]: https://babeljs.io/
[postcss]: https://github.com/postcss/postcss
[Stylus]: http://stylus-lang.com/

## Development

For commands to be ran on development, use `@dev`. Use this to inject some extra tools. In this example, we'll use [browserify-inc][] to produce faster incremental builds, and [browserify-hmr][] for fast module reloading.

```js
// @make: browserify %s -t babelify
// @dev: browserify-inc %s -t babelify -t browserify-hmr

...
```

[browserify-inc]: https://github.com/jsdf/browserify-incremental
[browserify-hmr]: https://github.com/AgentME/browserify-hmr

## Multiline

End the `@make:` directive with a newline. It will pick up the rest of the comment block as the command.

```js
/*
 * @make:
 * browserify %s -t babelify | \
 *   uglifyjs -cm
 */
```

## Todo

This doesn't exist yet; this README is simply a draft of the proposed API.
