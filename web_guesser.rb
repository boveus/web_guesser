require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(100)

get '/' do
  guess = params["guess"]
  message = check_guess(guess)
  erb :index, :locals => {:message => message}
end

def check_guess(guess)
  message = "You guessed #{guess}. <br>"
  if guess.to_i > SECRET_NUMBER  + 4
    message += "That is way too high."
  elsif guess.to_i < SECRET_NUMBER - 4
    message += "That is way too low."
  elsif guess.to_i < SECRET_NUMBER
    message += "That is too low."
  elsif guess.to_i > SECRET_NUMBER
    message += "That is too high."
  elsif guess.to_i == SECRET_NUMBER
    message += "That is correct!"
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
