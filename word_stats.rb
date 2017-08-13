file_name = ARGV.first
raise 'No input filename' unless file_name

POS_BLACKLIST = %w( DET P+D PUNC NUM )
LEMMA_BLACKLIST = %w( d )

vocabulary = {}

File.open(file_name).each do |raw_line|
  line = raw_line.chomp
  word, pos, lemma = line.split "\t"
  unless POS_BLACKLIST.include?(pos) || LEMMA_BLACKLIST.include?(lemma)
    vocabulary[lemma] ||= 0
    vocabulary[lemma] += 1 
  end
end

vocabulary.sort_by(&:last).reverse.to_h.each do |lemma, count|
  puts "#{ lemma }\t#{ count }"
end
