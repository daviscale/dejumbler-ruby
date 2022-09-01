require 'rails_helper'

RSpec.describe Word, type: :model do
  describe "validation" do
    it "fails validation when word is absent" do
      errors = Word.create.errors
      expect(errors.size).to eq(2)
      expect(errors[:word]).to contain_exactly("can't be blank", "is too short (minimum is 4 characters)")
    end

    it "fails validation word is less than 4 characters" do
      errors = Word.create(word: "abc").errors
      expect(errors.size).to eq(1)
      expect(errors[:word]).to contain_exactly("is too short (minimum is 4 characters)")
    end

    it "fails validation word is greater than 6 characters" do
      errors = Word.create(word: "abcdefg").errors
      expect(errors.size).to eq(1)
      expect(errors[:word]).to contain_exactly("is too long (maximum is 6 characters)")
    end

    it "fails validation when a non a-z character is used" do
      chars = ["-", "0", ",", "!", "A"]
      chars.each do |c|
        errors = Word.create(word: "abcd#{c}").errors
        expect(errors.size).to eq(1)
        expect(errors[:word]).to contain_exactly("can only be a-z lowercase")
      end
    end

    it "passes validation if a 4-6 a-z only word is used" do
      expect(Word.create(word: "abcd").errors.empty?).to eq(true)
      expect(Word.create(word: "abcde").errors.empty?).to eq(true)
      expect(Word.create(word: "abcdf").errors.empty?).to eq(true)
    end
  end
end
