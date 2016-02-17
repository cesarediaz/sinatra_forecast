require 'sinatra'
require './routes'

set :root, File.dirname(__FILE__)
set :views, settings.root + '/views'
