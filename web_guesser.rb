require 'sinatra'
require 'sinatra/reloader'

get '/' do
  number = 1
  erb :index, :locals => {:number => number}
end
# Change your ERB template to
# output a variable named number:
#
# 1
# The SECRET NUMBER is <%= number %>
