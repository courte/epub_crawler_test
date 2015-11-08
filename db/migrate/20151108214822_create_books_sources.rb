class CreateBooksSources < ActiveRecord::Migration
  def change
    create_table :books_sources do |t|
      t.belongs_to :book
      t.belongs_to :source
      t.string     :identification
      t.string     :download_uri
    end
  end
end
