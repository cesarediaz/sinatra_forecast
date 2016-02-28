require 'sinatra'
require 'yaml'
require 'open_weather'
require 'sinatra/activerecord'
require 'geocoder'

require './routes/routes'
require './config/countries'
require './lib/request'
require './lib/open_weather_data'
require './models/city.rb'
require './config/initializers/geocoder'

set :title, 'Forecast Weather'
set :root, File.dirname(__FILE__)
set :views, settings.root + '/views'
set :open_weather_options, { units: "metric", APPID: ENV['OPEN_WEATHER_KEY'], cnt: 16}
