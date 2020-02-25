require 'json'
require 'open-uri'

class GamesController < ApplicationController
  def new
    grid_size = 10
    @letters = Array.new(grid_size) { ('A'..'Z').to_a.sample }
  end

  def included?(guess, grid)
    guess.chars.all? { |letter| guess.count(letter) <= grid.count(letter) }
  end

  def score
    @word = params[:word]
    @letters_given = params[:letters] #aktuell string ohne kommas
    url = "https://wagon-dictionary.herokuapp.com/#{@word}"

    api_word_serialized = open(url).read
    api_word = JSON.parse(api_word_serialized)

    if included?(@word, @letters_given) && api_word["found"] == true
      @message = "Congratulations! You won with #{@word}"
    elsif api_word["found"] == true
      @message = "Sorry, but #{@word} cannot be built from #{@letters_given}"
    else
      @message = "I am sorry, but #{@word} does not seem to be a valid English word"
    end
  end
end
