class Subject < ActiveRecord::Base
  has_many :books_subjects
  has_many :books, through: :book_subjects

  # include PgSearch
end
