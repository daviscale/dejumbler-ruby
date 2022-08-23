class WordsController < ApplicationController
  def index
  end

  def dejumble
    render json: { foo: :bar }
  end
end
