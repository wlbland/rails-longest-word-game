class GamesController < ApplicationController
  def new
    # generate ten random letters
    letters = ('A'..'Z').to_a
    vowels = ['A', 'E', 'I', 'O', 'U']
    consonants = letters - vowels
    @grid = vowels.sample(4) + consonants.sample(6)
  end

  def score
    @grid = params[:grid].split(" ")
    @word_entered = params[:word].upcase.chars
    # The word can't be built out of the original grid
    if inside?(@word_entered, @grid)
      @score = "The word is in the grid"
    else
      @score = "word isn't in grid"
    end
    # elsif @word_entered == "not in dictionary"
    #   return "Sorry, but "

    # end
    # if @selected_letters
    # The word is valid according to the grid, but is not a valid English word
    # The word is valid according to the grid and is an English word
  end


  def inside?(attempt, grid)
    attempt.all? do |letter|
      grid.count(letter) >= attempt.count(letter)
    end
  end
end
