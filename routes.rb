get '/' do
  haml :"index"
end

get '/forecast' do
  @country = params['country']
  @city = params['city']
  @city_weather = OpenWeather::Forecast.city("#{params['city']}, #{params['country']['name']}", settings.open_weather_options)
  haml :"forecast", locals: {country: @country, city: @city, city_weather: @city_weather }
end
