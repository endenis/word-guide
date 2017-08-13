# word-guide

Currently, this command-line tool displays statistics of word usage.
It expects to get a file of words with their parts of speech and lemmas.
It can be used with output of this POS tagger and lemmatizer: [http://staffwww.dcs.shef.ac.uk/people/A.Aker/activityNLPProjects.html](http://staffwww.dcs.shef.ac.uk/people/A.Aker/activityNLPProjects.html).


## Usage

`ruby word_stats.rb input.txt > output.txt`

It can also be run with a list of already known words:

`ruby word_stats.rb input.txt known_words.txt > output.txt`

## Requirements

This tool was developed with Ruby 2.3.1. Other Ruby versions were not tested.
