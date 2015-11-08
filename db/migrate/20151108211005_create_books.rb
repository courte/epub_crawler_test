class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string  :title, null: false
      t.string  :description
      t.string  :language, null: false
      t.string  :type
      t.string  :date
      t.string  :rights
      t.integer :licenses
    end

    add_index :books, :title
    add_index :books, :language
  end
end

