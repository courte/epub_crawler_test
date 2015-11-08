class CreateCreators < ActiveRecord::Migration
  def change
    create_table :creators do |t|
      t.string  :name, null: false
    end

    add_index :creators, :name
  end
end
