file_name = ARGV[0]
corpus_file_name = ARGV[1]
raise 'No input filename' unless file_name

POS_BLACKLIST = %w( DET P+D PUNC NUM )
LEMMA_BLACKLIST = %w( d )

known_words = []

if corpus_file_name
  File.open(corpus_file_name).each do |raw_line|
    word = raw_line.chomp
    known_words << word
  end
end

vocabulary = {}

File.open(file_name).each do |raw_line|
  line = raw_line.chomp
  word, pos, raw_lemma = line.split "\t"
  lemma = raw_lemma.downcase
  unless POS_BLACKLIST.include?(pos) || LEMMA_BLACKLIST.include?(lemma) || known_words.include?(lemma)
    vocabulary[lemma] ||= 0
    vocabulary[lemma] += 1 
  end
end

vocabulary.sort_by(&:last).reverse.to_h.each do |lemma, count|
  puts "#{ lemma }"#\t#{ count }"
end
