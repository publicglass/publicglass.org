# Public Glass

San Francisco's Center for Glass Art

## Running locally

Public Glass uses [Middleman](http://middlemanapp.com/), a Ruby-based static site generator, to render the site in development mode. 

### Requirements

- Installed Xcode or [osx-gcc-installer](https://github.com/kennethreitz/osx-gcc-installer)
- [Heroku Toolbelt](https://toolbelt.heroku.com)
- Ruby 1.9 [[Mac OS X](http://jewelrybox.unfiniti.com/)] [[Windows](http://rubyinstaller.org)]
- [Bundler](http://gembundler.com)

### Setup

Get Public Glass running locally with the following steps:

```
$ git clone git://github.com/publicglass/publicglass.org.git && cd publicglass.org
$ bundle install
$ middleman
$ open http://localhost:4567
```

## Deployment

Though it is a static site, Public Glass runs on Heroku and utilizes the [multi-buildpack](http://github.com/ddollar/heroku-buildpack-multi) to chain the [middleman buildpack](http://github.com/meskyanichi/heroku-buildpack-middleman) and [nginx buildpack](http://github.com/essh/heroku-buildpack-nginx). This allows site generation to occur when you do a `git push heroku master` and serves the content via the very fast nginx:

```
$ git clone git://github.com/publicglass/publicglass.org.git && cd publicglass.org
$ heroku create --buildpack git://github.com/ddollar/heroku-buildpack-multi.git
$ heroku config:set HOST=publicglass.org
$ git push heroku master
$ heroku open
```
