# In this file, we'll load the books from the data/ directory
# from XML to in-database Book records.

# Load HathiTrust books.
HathiParser.new.load

# Load Gutenberg books.
GutenbergParser.new.load
