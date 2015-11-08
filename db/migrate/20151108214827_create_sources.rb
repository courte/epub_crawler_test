class CreateSources < ActiveRecord::Migration
  def change
    create_table :sources do |t|
      t.string  :name, null: false
    end
  end
end
