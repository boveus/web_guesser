require 'sinatra'
require 'sinatra/base'
require 'sinatra/reloader'

  SECRET_NUMBER = rand(100)
  @@remaining_guesses = 5

  get '/' do
    guess = params["guess"]
    cheat = params[:cheat]
    guess_handler(guess, cheat)
  end

  def welcome
    'Welcome to number guesser, please enter a guess between 1 and 100.'
  end

  def guess_handler(guess, cheat)
    if @@remaining_guesses == 5 && guess.nil?
      message = welcome
      guess = params["guess"]
      if cheat then message =+ "The secret number is #{SECRET_NUMBER} ;-) <br>" end
      erb :index, :locals => {:message => message, :background_color => 'white'}
    elsif @@remaining_guesses == 5 && !guess.nil?
      display_page(guess, cheat)
    elsif @@remaining_guesses > 1
      display_page(guess, cheat)
    else
      @@remaining_guesses = 5
      guess = params["guess"]
      erb :index, :locals => {:message => player_lost, :background_color => 'white'}
    end
  end

  def display_page(guess, cheat)
    message, background = check_guess(guess)
    @@remaining_guesses -= 1
    if cheat then message =+ "The secret number is #{SECRET_NUMBER} ;-) <br>" end
    message += "You have #{@@remaining_guesses} guess(es) remaining. <br>"
    erb :index, :locals => {:message => message, :background_color => background}
  end

  def cheat_handler(cheat)
    if cheat then message += "The secret number is #{SECRET_NUMBER}" end
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
