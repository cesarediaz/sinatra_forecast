require 'sinatra'
require './routes'

require 'sinatra/support/countryhelpers'
require 'sinatra/support/htmlhelpers'
require 'yaml'
require 'open_weather'

set :config, YAML::load_file(File.join(__dir__, 'config', 'config.yml'))
set :root, File.dirname(__FILE__)
set :views, settings.root + '/views'

helpers Sinatra::HtmlHelpers
helpers Sinatra::CountryHelpers
