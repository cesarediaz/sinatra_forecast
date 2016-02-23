get '/' do
  haml :"index"
end

get '/forecast' do
  @country = params['country']
  @city = params['city']
  @city_weather = OpenWeather::Forecast.city("#{params['city']}, #{params['country']['name']}", settings.open_weather_options)
  City.save(@city_weather)
  haml :"forecast", locals: {country: @country, city: @city, city_weather: @city_weather }
end

get '/widget/:id/:date' do
  @weather = City.find_by(city_id: params['id'])
  @date = params[:date]
  haml :"widget", locals: {weather: @weather, date: @date}
end
