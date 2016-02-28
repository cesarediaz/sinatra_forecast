class OpenWeatherData
  def initialize(settings = {}, city = '', country = '')
    @city_weather = {}
    @city = city
    @country = country
  end

  def getData
    if !@city == '' || !@country == ''
      @city_weather = OpenWeather::Forecast.city("#{@city}, #{@country}", settings.open_weather_options)
    end
    @city_weather
  end
end
