class Source < ActiveRecord::Base
  has_many :books_sources
  has_many :books, through: :books_sources
end
