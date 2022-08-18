class Word < ApplicationRecord
  validates :word, length: { minimum: 4, maximum: 6 }
  validate :word_is_only_az

  after_initialize do
    self.word = word.downcase
  end

  private

  def word_is_only_az
    word =~ /[a-z]+/
  end
end
