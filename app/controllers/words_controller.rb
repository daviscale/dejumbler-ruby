class WordsController < ApplicationController

  def index
    @words = Word.dejumble(params[:jumbled_word])
  end

end
