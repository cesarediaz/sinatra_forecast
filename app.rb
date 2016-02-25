require 'sinatra'
require './routes/routes'

require 'yaml'
require 'open_weather'
require './config/countries'
require 'sinatra/activerecord'
require './models/city.rb'
require 'geocoder'
require './config/initializers/geocoder'

set :title, 'Forecast Weather'
set :root, File.dirname(__FILE__)
set :views, settings.root + '/views'
set :open_weather_options, { units: "metric", APPID: ENV['OPEN_WEATHER_KEY'], cnt: 16}
