require 'sinatra'
require 'sinatra/reloader'

get '/' do
  number = 1
  guess = params["guess"]
  message = "You guessed #{guess}\n"
  if guess.to_i > number  + 4
    message += "That is way too high."
    erb :index, :locals => {:guess => guess, :message => message}
  elsif guess.to_i < number - 4
    message += "That is way too low."
    erb :index, :locals => {:guess => guess, :message => message}
  elsif guess.to_i < number
    message += "That is too low."
    erb :index, :locals => {:guess => guess, :message => message}
  elsif guess.to_i > number
    message += "That is too high."
    erb :index, :locals => {:guess => guess, :message => message}
  elsif guess.to_i == number
    message += "That is correct!"
    erb :index, :locals => {:guess => guess, :message => message}
  end

end

# get '/' do
#   guess = params["guess"]
#   message = check_guess(guess)
#   erb :index, :locals => {:number => number, :message => message}
# end
# To make it work as expected, you can assign the secret number to a constant:
#
# 1
# SECRET_NUMBER = rand(100)
