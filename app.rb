require 'sinatra'
require './routes/routes'

require 'yaml'
require 'open_weather'
require './config/countries'
require 'sinatra/activerecord'
require './models/city.rb'

set :title, 'Forecast Weather'
set :config, YAML::load_file(File.join(__dir__, 'config', 'config.yml'))
set :root, File.dirname(__FILE__)
set :views, settings.root + '/views'

set :open_weather_options, { units: "metric", APPID: settings.config['weather_key'], cnt: 16}
