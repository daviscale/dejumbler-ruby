def includes_blocked_char(word)
  blocked_chars = ["\'", "è"]
  blocked_chars.each do |char|
    return true if word.include?(char)
  end
  false
end

# TODO replace with drop table
Word.destroy_all

words = File.open("tmp/american-english-insane").readlines.map(&:chomp)

puts "Found #{words.length} words in file"

batch, batch_size = [], 1_000 
words.each do |word|
  next if word.length < 4 
  next if word.length > 6
  next if includes_blocked_char(word)

  batch << Word.new(word: word)
  if batch.size >= batch_size
    Word.import batch
    batch = []
  end
end

Word.import batch

puts "Loaded #{Word.count} words to database"
