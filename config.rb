require 'bundler'
Bundler.require

require './lib/helpers'

helpers ApplicationHelpers

Time.zone = "Pacific Time (US & Canada)"

set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'

set :markdown_engine, :redcarpet
set :markdown, tables: true, autolink: true, no_intra_emphasis: true, strikethrough: true, with_toc_data: true

page "/", :layout => "application"
page "feed.atom", :layout => nil
page "*", :layout => "page"

activate :i18n
activate :directory_indexes

activate :blog do |blog|
  blog.permalink = ":year/:title"
  blog.sources = "articles/:year-:month-:day-:title"
  blog.layout = "article"
end

configure :build do
  use Rack::GoogleAnalytics, tracker: ENV['GOOGLE_ANALYTICS_TRACKER_ID'] if ENV['GOOGLE_ANALYTICS_TRACKER_ID']

  activate :asset_hash, :exts => ['.js', '.css', '.png', '.gif', '.jpg', '.woff']
  activate :minify_css
  activate :minify_javascript
  activate :gzip
end
