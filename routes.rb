get '/' do
  haml :"index"
end

get '/forecast' do
  haml :"forecast"
end
