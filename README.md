# ePub Crawler

A simple application to search for ebooks from free sources: currently [Project Gutenberg](http://www.gutenberg.org/) and [HathiTrust](http://www.hathitrust.org/).

## Setup

This application requires Ruby & the bundler gem. To start working with the app:

1. `bundle install`
2. `bundle exec rake db:create`
3. `bundle exec rake db:migrate`
4. `irb -r ./config/environment` and (inside irb) `HathiParser.new.load` (eventually this work will be moved to the seeds file)

## Architecture

This application will need a number of different parts to get going:

- **A Canonical Book object with the appropriate data for the application:** including dependent classes such as Subjects, Creators, etc.
- **Service objects for each ebook source that know how to translate raw data into a Canonical Book**: i) These service objects should check for existing books in the database before creating a new book. ii) If no book exists, these objects should create a new book and add the source information. iii) If a book already exists, these objects should add themselves as a source (if they are not already added as a source).
- **A database to hold Canonical Book objects & dependent classes and search against them:** This should include indexing along common search areas, such as subjects, authors/creators, titles, etc.
- **A background job for each ebook source (likely not possible in this short release):** This background job would run once a day to update against existing sources, adding new books and/or sources as they become available.
- **A totally swanky view to display each awesome book:** Completely untouched in this version, but a way to search is important to a search app, of course. I've also started setting up PgSearch to allow easy searching against the database.
