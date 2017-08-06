require 'sinatra'
require 'sinatra/base'
require 'sinatra/reloader'

  SECRET_NUMBER = rand(100)
  @@remaining_guesses = 5

  get '/' do
    guess = params["guess"]
    guess_handler(guess)
  end

  def guess_handler(guess)
    if @@remaining_guesses > 1
      @@remaining_guesses -= 1
      message, background = check_guess(guess)
      message += "You have #{@@remaining_guesses} guess(es) remaining. <br>"
      erb :index, :locals => {:message => message, :background_color => background}
    else
      @@remaining_guesses = 5
      message = player_lost
      guess = params["guess"]
      erb :index, :locals => {:message => message, :background_color => 'white'}
    end
  end

  def player_lost
    "You lost and you have no guesses remaining. <br>" +
    "Fear not, for I am a merciful number guessing god. <br>" +
    "I have reset the number and granted you 5 more guesses."
  end

  def check_guess(guess)
    message = "You guessed #{guess}. <br>"
    if guess.to_i > SECRET_NUMBER  + 4
      return message + "That is way too high. <br>", 'red'
    elsif guess.to_i < SECRET_NUMBER - 4
      return message + "That is way too low. <br>", 'red'
    elsif guess.to_i < SECRET_NUMBER
      return message + "That is too low. <br>", 'tomato'
    elsif guess.to_i > SECRET_NUMBER
      return message + "That is too high. <br>", 'tomato'
    elsif guess.to_i == SECRET_NUMBER
      return message + "That is correct! <br>", 'green'
    end
  end


# Create a class variable with @@ that keeps track of
#  how many guesses they have remaining
# When subtract one from that each guess
# If the guesses reach zero, then…
# Generate a new number
# Set the number of guesses back to five
# Show them a message that they’ve lost and a new number has been generated
# If they guess correctly, then…
# Generate a new number
# Set the number of guesses back to five
# Show the message that they’ve guessed correctly
