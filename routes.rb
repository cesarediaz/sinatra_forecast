get '/' do
  haml :"index"
end

get '/forecast' do
  @country = params['country']
  @city = params['city']
  haml :"forecast", locals: {country: @country, city: @city}
end
