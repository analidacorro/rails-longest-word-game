require 'open-uri'
require 'json'
require 'time'

class GamesControllerController < ApplicationController
  def new
    char = %w[a b c d e f g h i j k l m n o p q r s t u v w x y z]
    counter = 0
    @letters = []
    while counter < 10
      @letters << char.sample(1).join
      counter += 1
    end
  end

  def score
    @letters = params[:letters]
    @word = params[:word]
    url= "https://wagon-dictionary.herokuapp.com/#{@word}"
    openurl = open(url).read
    @answer = JSON.parse(openurl)
    if @answer['found'] == false
      @message = "Not an english word"
    elsif @word.upcase.chars.all? { |let| @word.upcase.count(let) <= @letters.upcase.count(let) } == false
      @message = "Not in the grid"
    else
      @message = "Great!"
    end
  end
end
