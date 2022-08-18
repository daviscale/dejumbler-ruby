Word.destroy_all

words = File.open("tmp/american-english-insane").readlines.map(&:chomp)

puts "Found #{words.length} words in file"

batch, batch_size = [], 1_000 
words.each do |word|
  word = Word.new(word: word)
  batch << word if word.valid?
  if batch.size >= batch_size
    Word.import batch
    batch = []
  end
end

Word.import batch

puts "Loaded #{Word.count} words to database"
