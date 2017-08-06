require 'sinatra'
require 'sinatra/reloader'

get '/' do
  secret_number = rand(100)
  "The secret number is #{secret_number}"
end
