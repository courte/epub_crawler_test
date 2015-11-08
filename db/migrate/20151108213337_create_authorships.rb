class CreateAuthorships < ActiveRecord::Migration
  def change
    create_table :authorships do |t|
      t.belongs_to :book
      t.belongs_to :creator
    end
  end
end
