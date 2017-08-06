require 'sinatra'
require 'sinatra/reloader'

get '/' do
  number = 1
  guess = params["guess"]
  message = "You guessed #{guess}\n"
  if guess.to_i > number
    message += "That is too high."
    erb :index, :locals => {:guess => guess, :message => message}
  elsif guess.to_i < number
    message += "That is too low."
    erb :index, :locals => {:guess => guess, :message => message}
  end
end
#
# if verbose == 'true'
#      erb :newResultPage, :locals => {:result => result}
#  elsif verbose == 'false'
#      erb :resultPage, :locals => {:result => result}
#  end
# Change your ERB template to
# output a variable named number:
#
# 1
# The SECRET NUMBER is <%= number %>

# if the guess is too high
#   set the message to "Too high!"
# end
# render the ERB template and pass in the number AND the message
#
