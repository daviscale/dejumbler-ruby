class Word < ApplicationRecord
  validates :word, length: { minimum: 4, maximum: 6 }
  validate :word_is_only_az

  after_initialize do
    self.word = word.downcase
  end

  def self.dejumble(jumbled_word)
    if jumbled_word
      [jumbled_word, jumbled_word]
    else
      []
    end
  end

  private

  def word_is_only_az
    word =~ /[a-z]+/
  end
end
