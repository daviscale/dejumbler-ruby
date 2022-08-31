require 'rails_helper'

RSpec.describe "words/index.html.erb", type: :view do
  context "on initial page load" do
    it "displays a form" do
      assign(:words, [])
      render

      expect_form(rendered)
    end
  end

  context "after dejumbling a word" do
     it "renders words and displays a form" do
      assign(:words, ["hello", "world"].map{ |w| Word.new(word: w) })
      render

      expect(rendered).to match /hello/
      expect(rendered).to match /world/
      expect_form(rendered)
     end
  end

  def expect_form(rendered)
    expect(rendered).to match /form action=\"\/words\"/
    expect(rendered).to match /Dejumble a word/
    expect(rendered).to match /jumbled word/
  end
end
