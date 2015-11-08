class BooksSource < ActiveRecord::Base
  belongs_to :source
  belongs_to :book
end
