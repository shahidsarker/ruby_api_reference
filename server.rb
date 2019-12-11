require 'sinatra'
require 'httparty'

@@url = 'https://samples.openweathermap.org/data/2.5/weather'

get '/' do
  # index template with a form
  erb :index
end

post '/weather' do
  # optionally puts the params object to the terminal for your debugging
  puts params
  # set @zip variable to the 'zip_code' from the params object
  @zip_param_from_form = params['zip_code']
  # create a GET request with HTTParty
  #   passing the @@url as the first argument
  # second argument is a query hash
  # query hash includes the query parameters I want to pass in the GET request
  req = HTTParty.get(@@url, query: { appid: ENV['WEATHER_SAMPLE_KEY'], zip: @zip_param_from_form })

  # 
  @data = JSON.parse(req.body)
  puts @data

erb :weather  
end
