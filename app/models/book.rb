class Book < ActiveRecord::Base
  has_many :authorships
  has_many :creators, through: :authorships
  has_many :books_subjects
  has_many :subjects, through: :books_subjects
  has_many :books_sources
  has_many :sources, through: :books_sources

  # has_many :identifiers, :formats, :publishers

  # include PgSearch
end
