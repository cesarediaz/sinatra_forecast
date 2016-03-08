get '/' do
  @city, @country = Request.new(request).location
  @city_weather = OpenWeather::Forecast.city("#{@city}, #{@country}", settings.open_weather_options)
  haml :"index", locals: { country: @country, city: @city, city_weather: @city_weather }
end

post '/forecast' do
  @country = params['country']
  @city = params['city']

  if !City.exist?(nil, @city, @country)
    @city_weather = OpenWeather::Forecast.city("#{@city}, #{@country}", settings.open_weather_options)
    City.save(@city_weather)
  else
    @city_weather = City.where('(name = ? AND country_code = ?)', @city.upcase, @country.upcase).first.body
  end
  haml :"forecast", locals: { country: @country, city: @city, city_weather: @city_weather }
end

get '/widget/:id/:date' do
  @weather = City.find_by(city_id: params['id'])
  @date = params[:date]
  haml :"widget", locals: { weather: @weather, date: @date }
end

get '/about' do
  haml :"about"
end
