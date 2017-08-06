require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(100)

get '/' do
  guess = params["guess"]
  message, background = check_guess(guess)
  erb :index, :locals => {:message => message, :background_color => background}
end

def check_guess(guess)
  message = "You guessed #{guess}. <br>"
  if guess.to_i > SECRET_NUMBER  + 4
    return message + "That is way too high.", 'red'
  elsif guess.to_i < SECRET_NUMBER - 4
    return message + "That is way too low.", 'red'
  elsif guess.to_i < SECRET_NUMBER
    return message + "That is too low.", 'tomato'
  elsif guess.to_i > SECRET_NUMBER
    return message + "That is too high.", 'tomato'
  elsif guess.to_i == SECRET_NUMBER
    return message + "That is correct!", 'green'
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
