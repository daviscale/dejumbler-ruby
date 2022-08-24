class Word < ApplicationRecord
  validates :word, length: { minimum: 4, maximum: 6 }
  validate :word_is_only_az

  def self.dejumble(jumbled_word)
    if jumbled_word
      possible_words = jumbled_word.downcase.chars.permutation.each.to_a.map(&:join)
      if possible_words.any?
        Word.select(:word).where(word: possible_words).distinct
      else
        []
      end
    else
      []
    end
  end

  private

  def word_is_only_az
    if word.match(/^([a-z]){4,6}$/).nil?
      errors.add(:word, "can only be a-z lowercase")
    end
  end
end
