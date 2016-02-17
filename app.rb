require 'sinatra'
require './routes'

require 'sinatra/support/countryhelpers'
require 'sinatra/support/htmlhelpers'

set :root, File.dirname(__FILE__)
set :views, settings.root + '/views'

helpers Sinatra::HtmlHelpers
helpers Sinatra::CountryHelpers
