class BooksSubject < ActiveRecord::Base
  belongs_to :book
  belongs_to :subject
end
