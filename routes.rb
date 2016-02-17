require 'open_weather'
require 'yaml'
config = YAML::load_file(File.join(__dir__, 'config', 'config.yml'))

get '/' do
  haml :"index"
end

get '/forecast' do
  @country = params['country']
  @city = params['city']
  open_weather_options = { units: "metric", APPID: config['weather_key'], cnt: 16}
  @city_weather = OpenWeather::Forecast.city("#{params['city']}, #{params['country']['name']}", open_weather_options)
  haml :"forecast", locals: {country: @country, city: @city, city_weather: @city_weather }
end
