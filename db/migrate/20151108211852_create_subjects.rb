class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string  :description
    end

    add_index :subjects, :description
  end
end
