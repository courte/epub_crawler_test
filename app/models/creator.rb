class Creator < ActiveRecord::Base
  has_many :books_creators
  has_many :books, through: :books_creators

  include PgSearch
end
