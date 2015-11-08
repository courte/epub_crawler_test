ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)

require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])
require 'rubygems'

require 'uri'
require 'pathname'

require 'pg'
require 'sinatra/activerecord'
require 'logger'

require 'sinatra'
require 'sinatra/reloader' if development?

require 'nokogiri'

# Some helper constants for path-centric logic
APP_ROOT = Pathname.new(File.expand_path('../../', __FILE__))

APP_NAME = APP_ROOT.basename.to_s

configure do
  set :root, APP_ROOT.to_path
  set :views, File.join(Sinatra::Application.root, "app", "views")
end

# Set up the services, controllers, and helpers
Dir[APP_ROOT.join('app', 'services', '*.rb')].each { |service| require service }
Dir[APP_ROOT.join('app', 'controllers', '*.rb')].each { |controller| require controller }
Dir[APP_ROOT.join('app', 'helpers', '*.rb')].each { |helper| require helper }

require APP_ROOT.join('config', 'database')
