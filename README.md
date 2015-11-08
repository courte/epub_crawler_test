# ePub Crawler
A simple application to search for ebooks from free sources: currently [Project Gutenberg](http://www.gutenberg.org/) and [HathiTrust](http://www.hathitrust.org/).

## Setup
This application requires Ruby 2.1.

## Architecture
This application will need a number of different parts to get going:
1. A Canonical Book object with the appropriate data for the application
2. Service objects for each ebook source that know how to translate raw data into a Canonical Book
3. A database to hold Canonical Book objects and search against them
4. A background job for each ebook source (likely not possible in this short release)
5. A totally swanky view to display each awesome book
